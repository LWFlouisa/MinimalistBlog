## Creates the directories themself.
def create_directories
  system("mkdir article;
          mkdir data;
          mkdir documents;
          mkdir feed;
          mkdir chatbot;
          mkdir archives; cd archives;
          mkdir feed_archive; mkdir blog_archive")

  system("cd data; mkdir title; cd title; touch > title.txt")
end

def create_post
  # Create a Date Of The Post
  system("cd date; date > time.txt")

  rss_title = File.read("date/time.txt").strip

  # These create a snapshot of the old archive, for appending above or below content.
  post_snapshot = File.read("archives/blog_archive/old_post.txt").strip
  rss_post_snap = File.read("archives/feed_archive/old_post.txt").strip

  blog_title    = File.read("data/title/title.txt").strip

  ## Standard html layout.
  html_begin   = "<html>"
  html_htop    = "  <head>"
  html_title   = "    <title>#{blog_title}</title>"
  html_style   = "
    <style>
      body {
        background-color: black;

        padding-left: 320px;
        padding-right: 320px;
      }

      h1, h2, h3, h4, h5, h6, p, pre, hr {
        font-family: monospace;
        color: lime;
      }

      a {
        font-family: monospace;
        color: blue;
      }

      .avatar {
        vertical-align: center;
        width: 100px;
        height: 100px;
        border-radius: 50%;
      }
    </style>
  "
  html_hbottom = "  </head>"
  html_bTop    = "  <body>"

  system("nano article/index.md; markdown article/index.md > documents/new_post.txt")

  new_post      = File.read("documents/new_post.txt").strip

  # Make post archive a mix of new post and old post with old post on bottom.
  total_post = "
    #{new_post}
    #{post_snapshot}
  "

  html_bBottom = "  </body>"
  html_end     = "</html>"

  ## RSS Encoding
  rss_encoding = "<?xml version='1.0' encoding='UTF-8' ?>"
  rss_begin    = "<rss version='2.0'>"
  rss_channelT = "<channel>"

  rss_new_post = File.read("documents/new_post.txt").strip

  rss_formatted_new = "
  <title>#{rss_title}</title>
  <link>http://192.168.1.5:8000/Microblogger/feed/feed.xml</link>
  <description><![CDATA[#{rss_new_post}]]></description>
  "

  rss_total_post = "
  #{rss_formatted_new}
  #{rss_post_snap}
  "

  rss_channelb = "</channel>"
  rss_end      = "</rss>"

  # Create the webpage.
  open("index.html", "w") { |f|
    f.puts html_begin
    f.puts html_htop
    f.puts html_title
    f.puts html_style
    f.puts html_hbottom
    f.puts html_bTop
    f.puts '<center><h3><img src="http://192.168.1.5:8000/quickdial/me.jpg" alt="Avatar" class="avatar"><br />LWFlouisa</h3>'
    f.puts "<a href=''><img src='http://192.168.1.5:8000/quickdial/socialmediabuttons/thumb.png' width='16px' height='16px'> Follow</a></center>" # Assign this later. Usually an RSS Feed.
    f.puts "<hr />"
    f.puts total_post
    f.puts html_bBottom
    f.puts html_end
    f.puts "<hr />"
  }

  ## Creates an RSS archive of your blog.
  open("feed/feed.xml", "w") { |f|
    f.puts rss_encoding
    f.puts rss_begin
    f.puts rss_channelT
    f.puts rss_total_post
    f.puts rss_channelb
    f.puts rss_end
  }

  # Create the total post snapshot the generator refers to.
  open("archives/blog_archive/old_post.txt", "w") { |f|
    f.puts total_post
  }

  # Create the total post snapshot the generator refers to.
  open("archives/feed_archive/old_post.txt", "w") { |f|
    f.puts rss_total_post
  }
end

## Uncomment create_post and comment create_post when directories created.
create_directories
# create_post
