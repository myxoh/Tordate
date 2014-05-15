class GuardianFeed
require 'open-uri'

#For The Guardian
def self.parserXML url
    page = Nokogiri::XML(open(url))   
end

def self.parserHTML url
    page = Nokogiri::HTML(open(url))   
end


def self.writeArticle headling,header,body,imagepicture,source,user_id
    ar=Article.create(headling:headling,header:header,body:body,user_id:user_id,score:(rand*4).to_i*10)
    Evidence.create(url:source,article_id:ar.id)
    if !imagepicture.nil?
        ar.picture = URI.parse(imagepicture)
        ar.save
    end
end

def self.min(a,b)
    if a<b then 
        return a 
    else 
     return b 
    end
end

def self.main
    u=User.find_by(username:"The_Guardian")
    if u.nil?
     u=User.create(username:"The_Guardian",email:"a@a.a",name:"",surname:"",encrypted_password:"$2a$10$rlK/lu7b8u.u0ck4Kf6AjOrqyBufH8Pr0a6Yn7DMsnCBQVrwWWCeO")
    end

    url = "http://www.theguardian.com/uk/rss"
    rssFeed = parserXML url
        @links = rssFeed.xpath('//item').map do |i|
            if !i.nil?
            {'title' => i.xpath('title').inner_text[0..min(100,i.xpath('title').inner_text.length)],
             'link' => i.xpath('link').inner_text, 
             'description' => if(i.xpath('description').inner_text.length > 10) then Nokogiri::HTML(i.xpath('description').inner_text[0..min(i.xpath('description').inner_text.length,100)]+"...").text else nil end
            }
            end
        end
        @links[0..6].each do |l|
            if !Article.find_by_headling(l["title"])
                article=parserHTML l["link"]
                body=""
                article.css('#article-body-blocks').css('p').each do |p|
                    body+='<p>'+p+"</p><br>"
                end
                if !article.css('#main-content-picture img').empty? then image=article.css('#main-content-picture img').first["src"] else image=nil end
                writeArticle(l["title"],l["description"],body,image,l["link"],u.id)
            end
                sleep 1
        end
    end
end
