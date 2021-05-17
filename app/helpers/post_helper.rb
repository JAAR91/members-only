module PostHelper
    def user_session(user)
        array = []
        if user
            array[0] = link_to 'Sign Out', destroy_user_session_path, method: :delete, class:'nav-link'
        else
            array[0] = link_to 'Register', new_user_registration_path, class:'nav-link'
            array[1] = link_to 'Sign In', new_user_session_path, class:'nav-link'
        end
        array
    end

    def user_name(user)
        if user.nil?
            return 'Not logged in'
        else
            return user.email
        end
    end

    def post_title(user, post)
        if user
            return link_to post.title, user_post_path(current_user.id, post.id), class:'link-info text-decoration-none text-break'
        else
            return post.title
        end
    end

    def user_email(user, post)
        unless user.nil?
            return post.user.email
        end
    end

    def user_post(user)
        unless user.nil?
            return link_to "New post", new_user_post_path(current_user.id), class:'link-success text-decoration-none text-uppercase'
        else
            return 'You need to log in to post'
        end
    end

    def modify_post(user, post)
        array = []
        if user.id == post.user_id
            array[0] = link_to "Edit", edit_user_post_path(current_user.id, @post.id), class:'mx-2 text-decoration-none link-primary'
            array[1] = link_to "Destroy", user_post_path(current_user.id,@post.id), method: :delete, data: { confirm: "Are you sure?" }, class:'link-danger mx-2 text-decoration-none'
            return array
        end
        return []
    end

    def no_comments(post)
        if post.comment.length.zero?
            return 'No comments yet'
        end
    end
end
