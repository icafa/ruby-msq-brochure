require "google_drive"

class BrochuresController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action  :verify_authenticity_token
  before_action :set_brochure, only: [:itemdetail, :create, :add_individual_page]


  def new
    @brochure = Brochure.find(1)
  end

  def add_individual_page
    directory_name = "#{Rails.root}/public/uploads/brochure/src/"
    directory_name += @brochure.id.to_s

    File.open(directory_name + "/goodu" + params[:page_number].to_s + ".json", 'wb') do |f|
      f.write(params[:image])
    end
    puts "********* add_individual_page *****"
    puts params[:page_number]
  end

  def create
    puts "******create ******"
    directory_name = "#{Rails.root}/public/uploads/brochure/src/"
    if params[:id] == "0"
      broch = Brochure.new
      broch.width = 17
      broch.height = 11
      broch.keywords = "newly designed brochure"
      broch.owner_type = "default"
      broch.save
      broch.name = "newdesign" + broch.id.to_s
      broch.src = "/public/uploads/brochure/src/"+ broch.id.to_s + "/goodu"
      broch.preimage = "/uploads/brochure/src/"+ broch.id.to_s + "/preimage.jpg"
      broch.brochuretype = params[:brochuretype]
      puts broch.src
    elsif @brochure.owner_type == 'default'
      broch = Brochure.new
      broch.width = 17
      broch.height = 11
      broch.keywords = "home, just listed, just sold, luxury, open house, print, property, property marketing"
      broch.owner_type = "user"
      broch.page_count = @brochure.page_count
      broch.save
      broch.name = "saved" + broch.id.to_s
      broch.src = "/public/uploads/brochure/src/"+ broch.id.to_s + "/goodu"
      broch.preimage = "/uploads/brochure/src/"+ broch.id.to_s + "/preimage.jpg"
      broch.brochuretype = @brochure.brochuretype
      if current_user
        broch.user_id = current_user.id
      end
      puts broch.src
    else
      broch = @brochure
    end
    broch.current_page_number = params[:page_number]
    broch.save


    directory_name += broch.id.to_s
    FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)

    if(params[:pdfimage])
      File.open(directory_name + "/experiment.pdf", 'wb') do |f|
        f.write(params[:pdfimage].read)
      end
    end
    if (params[:preimage])
      File.open(directory_name + "/preimage.jpg", 'wb') do |f|
         f.write(params[:preimage].read)
      end
    end

    @brochure = broch
    puts "*******create end ******"
  end

  def property
    puts "**************"
    puts params[:libtype]
    puts params[:brochuretype]
    if params[:libtype] == "save" && params[:brochuretype] == "all"
      puts "*********saved designs collect**********"
      @entirebrochures = Brochure.where(:owner_type => "user").where(:user_id => current_user).order("name ASC")
    else
      @entirebrochures = Brochure.where(:owner_type => "default").where(:brochuretype => params[:brochuretype]).order("name ASC")
    end
  end

  def itemdetail
    puts @brochure.src
  end

  def brochures_area_change
    if(params[:sorttype] == 'z-a')
       totalBrochure = Brochure.all.order("name DESC").where(:brochuretype => params[:brochuretype])
    else
       totalBrochure = Brochure.all.order("name ASC").where(:brochuretype => params[:brochuretype])
    end
    if(params[:libtype])
      if(params[:libtype] == 'design')
        @pBrochures = totalBrochure.where(:owner_type => "default")
      elsif(params[:libtype] == 'save')
        @pBrochures = totalBrochure.where(:owner_type => "user").where(:user_id => current_user)
      end
    else
      @pBrochures = totalBrochure.where(:owner_type => "default")
    end
    if(!params[:keyword])
      @entirebrochures = @pBrochures
    else
      @entirebrochures = []
      count = 0
      keyword = params[:keyword].downcase()

      @pBrochures.each do |bro|
        if bro.keywords.downcase().include?keyword
          @entirebrochures[count] = bro
          count += 1
        elsif bro.name.downcase().include?keyword
          @entirebrochures[count] = bro
          count += 1
        end
      end
    end
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def json_params
    params.permit(:image, :pdfimage, :preimage, :brochuretype, :page_number)
  end

  def individual_params
    params.permit(:image, :page_number)
  end

  def brochures_area_params
    params.permit(:libtype, :keyword, :sorttype, :brochuretype)
  end

  def set_brochure

    if params[:id] != "0"
      @brochure = Brochure.find(params[:id])
    end
  end

end
