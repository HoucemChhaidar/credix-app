import 'package:auto_route/annotations.dart';
import 'package:credix_app/core/presentation/resources/sizes/app_sizes.dart';
import 'package:credix_app/core/presentation/widgets/widgets.dart';
import 'package:credix_app/features/barcode/data/datasources/websocket_service.dart';
import 'package:credix_app/features/barcode/data/models/transaction_notification.dart';
import 'package:credix_app/features/barcode/presentation/blocs/websocket/web_socket_bloc.dart';
import 'package:credix_app/features/barcode/presentation/widgets/transaction_success_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {
  TransactionNotification? _currentNotification;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebSocketBloc(WebSocketService())..add(const WebSocketEvent.connect()),
      child: BlocListener<WebSocketBloc, WebSocketState>(
        listenWhen: (prev, curr) => curr.maybeWhen(received: (_) => true, orElse: () => false),
        listener: (context, state) {
          state.maybeWhen(
            received: (transactionDetails) {
              setState(() => _currentNotification = transactionDetails);

              Future.delayed(const Duration(seconds: 5), _closeTransactionSuccess);
            },
            orElse: () {},
          );
        },
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _currentNotification == null
              ? _buildBarcodeContent(context)
              : TransactionSuccessContent(
                  notification: _currentNotification!,
                  onClose: _closeTransactionSuccess,
                ),
        ),
      ),
    );
  }

  Widget _buildBarcodeContent(BuildContext context) {
    return const Column(
      key: ValueKey('barcode'),
      children: [
        AppBackButton(),
        SizedBox(height: AppSizes.md),
        BarcodeCard(),
      ],
    );
  }

  void _closeTransactionSuccess() {
    if (mounted) setState(() => _currentNotification = null);
  }
}
