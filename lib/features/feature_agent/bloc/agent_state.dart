part of 'agent_bloc.dart';

sealed class AgentState extends Equatable {
  const AgentState();

  @override
  List<Object?> get props => [];
}

final class AgentLoadingState extends AgentState {}

final class AgentSuccessState extends AgentState {
  final List<Agent> agentList;
  const AgentSuccessState({
    required this.agentList,
  });

  @override
  List<Object?> get props => [agentList];
}

final class AgentErrorState extends AgentState {
  final String message;
  final List<Agent>? cachedAgentList;
  const AgentErrorState({required this.message, required this.cachedAgentList});

  @override
  List<Object?> get props => [message, cachedAgentList];
}
