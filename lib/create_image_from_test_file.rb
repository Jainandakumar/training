class CreateImageFromTestFile
  def self.image
   FileUtils.mkdir_p "#{Rails.root}/images"
    File.open("#{Rails.root}/text.txt","r").each_line do | line |
      Image.transaction do  #here we have used transaction to prevent the creation of dependency
        begin
debugger
          image_name=line.split(" ")[0].strip
          image_path=line.split(" ")[1].chomp.strip
          n=system("wget #{image_path}")
          if n
            FileUtils.mv "#{Rails.root}/#{image_path.split("/").last}" , "#{Rails.root}/images"
            lcl_image_path="#{Rails.root}/images/#{image_path.split("/").last}"
            Image.create(:photo=>File.open("#{lcl_image_path}","rb"),:image_name=>"#{image_name}")
          end
        rescue Exception => e
        rescue_log=Logger.new("#{Rails.root}/log/image_script.log")
        rescue_log.info("This is the error: #{e.messages} and it occured on this mention line: #{line}")
        end
      end
    end
  end
end
