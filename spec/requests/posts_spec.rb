require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.new(author: user, title: 'Hello', text: 'This is my first post') }

  describe 'GET /users/:user_id/posts' do
    it 'renders the posts index page' do
      get "/users/:#{user.id}/posts"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id/posts' do
    it 'renders the post index page with correct template' do
      get "/users/:#{user.id}/posts"
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts' do
    it 'renders the post index page with correct placeholder text' do
      get "/users/:#{user.id}/posts"
      expect(response.body).to include('Post 1')
    end
  end

  describe '/users/:user_id/posts/:id' do
    it 'renders the post show page' do
      get "/users/:#{user.id}/posts/:#{post.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the post show page with correct template' do
      get "/users/:#{user.id}/posts/:#{post.id}"
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the post show page with correct placeholder text' do
      get "/users/:#{user.id}/posts/:#{post.id}"
      expect(response.body).to include('All Posts by User')
    end
  end

end
