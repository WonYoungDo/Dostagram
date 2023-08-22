package com.tawny.dostagram.post.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tawny.dostagram.comment.dto.CommentDetail;
import com.tawny.dostagram.comment.service.CommentService;
import com.tawny.dostagram.common.FileManager;
import com.tawny.dostagram.like.service.LikeService;
import com.tawny.dostagram.post.domain.Post;
import com.tawny.dostagram.post.dto.PostDetail;
import com.tawny.dostagram.post.repository.PostRepository;
import com.tawny.dostagram.user.domain.User;
import com.tawny.dostagram.user.service.UserService;

@Service
public class PostService {
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private LikeService likeService;
	
	
	// 사용자가 업로드한 게시물을 저장하는 기능
	public int addPost(int userId, String contents, MultipartFile file) {
		
		String imagePath = FileManager.saveFile(userId, file);
		
		return postRepository.insertPost(userId, contents, imagePath);
	}
	
	// 사용자들이 업로드한 게시물들을 보여주는 기능
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> postList = postRepository.selectPost();
		List<PostDetail> postDetailList	= new ArrayList<>();
		
		for(Post post : postList) {
			
			// 게시글의 아이디와 로그인한 사용자의 아이디를 가져오기(파라미터로 userId를 전달받는다)
			boolean isLike =  likeService.isLike(post.getUserId(), userId);
			
			// postId를 기반으로 좋아요 개수를 likeService에서 얻어오기 
			int likeCount = likeService.getCountByPostId(post.getId());
			
			// postId를 기반으로 사용자들이 입력한 댓글 정보를 commentService에서 얻어오기
			List<CommentDetail> commentList = commentService.getCommentList(post.getId());
			
			// userService에서 userId를 기반으로 사용자 정보 얻어오기
			User user = userService.getUserId(post.getUserId());
				
				// 사용자가 올린 각각의 게시물에 필요한 정보들을 저장
				PostDetail postDetail = PostDetail.builder()
												  .id(post.getId())
												  .contents(post.getContents())
												  .imagePath(post.getImagePath())
												  .userId(post.getUserId())
												  .userName(user.getName())
												  .commentList(commentList)
												  .likeCount(likeCount)
												  .isLike(isLike)
												  .build();									  
				postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}	
		
	// 자신이 올린 게시물을 삭제하는 기능
	public int deletePost(int postId, int userId) {
		
		// postId를 기반으로 특정 행을 조회ㅣ
		Post post = postRepository.selectPostId(postId);
		if(userId == postId) {
			// postId를 기반으로 조회된 좋아요와 댓글을 불러온다
			likeService.deleteLikeByPostId(postId);
			commentService.deleteCommentByPostId(postId);
			
			// postId를 통해서 해당되는 이미지 파일 삭제
			FileManager.removeFile(post.getImagePath());
			
			return postRepository.deletePost(postId);			
		} else {
			return 0;
		}
		
	}
}
