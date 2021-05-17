module ComentHelper
    def modify_comment(user, comment)
        array = []
        if user.id == comment.user_id
            array[0] = link_to "Edit", edit_post_comment_path(comment.post.id, comment.id), class:'mx-2 text-decoration-none link-primary'
            array[1] = link_to "Destroy", post_comment_path(comment.post.id, comment.id), method: :delete, data: { confirm: "Are you sure?" }, class:'link-danger mx-2 text-decoration-none'
            return array
        end
        return []
    end
end
