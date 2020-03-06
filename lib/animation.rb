def movie_buffs_animation

    welcome_to_frames = [<<-FRAME1, <<-FRAME2, <<-FRAME3, <<-FRAME4, <<-FRAME5, <<-FRAME6] 
    ~-~-~-~-~-~-~-
    @~WELCOME~ 
    -~-~-~-~-~-~-~
        FRAME1
    -~-~-~-~-~-~-~
     ~WEL@COME~ 
    ~-~-~-~-~-~-~-
        FRAME2
    ~-~-~-~-~-~-~-
     ~WELCOME~@
    -~-~-~-~-~-~-~
        FRAME3
    ~-~-~-~-~-~-~-
    @  ~TO~
    -~-~-~-~-~-~-~
    FRAME4
    -~-~-~-~-~-~-~
       ~T@O~
    ~-~-~-~-~-~-~-
    FRAME5
    ~-~-~-~-~-~-~-
       ~TO~   @
    -~-~-~-~-~-~-~
    FRAME6
    
    
    welcome_to_frames.each do |f|
        puts "\e[H\e[2J"
        puts f 
        sleep(0.3)
    end 
    
    
    movie_buffs_frames = [<<-FRAME7, <<-FRAME8, <<-FRAME9]
    ~-~-~-~-~-~-~-
    @~MOVIE BUFFS~
    -~-~-~-~-~-~-~
    FRAME7
    -~-~-~-~-~-~-~
     ~MOVIE@BUFFS~
    ~-~-~-~-~-~-~-
    FRAME8
    ~-~-~-~-~-~-~-
     ~MOVIE BUFFS~@
    -~-~-~-~-~-~-~
    FRAME9
    
    movie_buffs_frames.each do |f|
    
        puts "\e[H\e[2J"
        puts f 
        sleep(0.3)
    
        movie_buffs_frames.reverse.each do |f|
            puts "\e[H\e[2J"
            puts f 
            sleep(0.3)
        end 
    end 
    
    end
    
    