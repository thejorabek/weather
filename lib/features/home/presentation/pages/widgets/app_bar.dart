import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_bloc.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_event.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';
Widget appBar(WeatherLoaded state, BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.white, size: 33),
        Text(
          state.cityName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const Spacer(),
        PopupMenuButton<String>(
          onSelected: (String result) {
            context.read<PopupBloc>().add(SelectItemEvent(result));
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Item 1',
              child: Text('Current location'),
            ),
            const PopupMenuItem<String>(
              value: 'Item 2',
              child: Text('Paris'),
            ),
            const PopupMenuItem<String>(
              value: 'Item 3',
              child: Text('Tokyo'),
            ),
          ],
          child: const Icon(Icons.menu, size: 33, color: Colors.white),
        ),
      ],
    );
  }



