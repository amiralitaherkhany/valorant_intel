import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/string_extensions.dart';
import 'package:valorant_intel/features/feature_agent/domain/entities/agent_entity.dart';

class AgentDetailPage extends StatelessWidget {
  const AgentDetailPage({
    super.key,
    required this.agentEntity,
  });
  final AgentEntity agentEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Hero(
                tag: agentEntity.displayName!,
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  Animation<double> textAnimation =
                      Tween<double>(begin: 14.0, end: 30.0).animate(animation);
                  return AnimatedBuilder(
                    animation: textAnimation,
                    builder: (context, child) {
                      return Text(
                        agentEntity.displayName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: textAnimation.value),
                      );
                    },
                    child: Text(
                      agentEntity.displayName!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 30.0),
                    ),
                  );
                },
                createRectTween: (begin, end) {
                  return RectTween(begin: begin, end: end);
                },
                child: Text(
                  agentEntity.displayName!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 20.0),
                ),
              ),
              centerTitle: true,
              background: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      for (var colorString
                          in agentEntity.backgroundGradientColors!) ...{
                        (colorString as String).parseToColor
                      }
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
              ),
            ),
            elevation: 5,
            pinned: true,
            floating: false,
            expandedHeight: 200,
            centerTitle: true,
            snap: false,
            stretch: true,
          ),
          SliverToBoxAdapter(
            child: Hero(
              tag: agentEntity.displayIcon!,
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                Animation<double> scaleAnimation = TweenSequence<double>([
                  TweenSequenceItem(
                      tween: Tween(begin: 1, end: 2), weight: 0.5),
                  TweenSequenceItem(
                      tween: Tween(begin: 2, end: 1), weight: 0.5),
                ]).animate(animation);

                return ScaleTransition(
                  scale: scaleAnimation,
                  child: fromHeroContext.widget,
                );
              },
              createRectTween: (begin, end) {
                return RectTween(begin: begin, end: end);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 100,
                  height: 100,
                  imageUrl: agentEntity.displayIcon!,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.white,
                    highlightColor: AppColors.grey,
                    child: Container(
                      color: Colors.grey,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text(index.toString()),
            ),
          )
        ],
      ),
    );
  }
}
