import 'package:demo_flutter_provider/post.dart';
import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostLoaded({ this.posts, this.hasReachedMax });

  PostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() => 'PostLoaded { post: ${posts.length}, hasReachedMax: $hasReachedMax }';
}