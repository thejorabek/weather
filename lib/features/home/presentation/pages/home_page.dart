import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/constants/image_constants.dart';
import 'package:weather/core/code/weather_code.dart';
import 'package:weather/features/home/presentation/pages/widgets/app_bar.dart';
import 'package:weather/features/home/presentation/pages/widgets/date_info.dart';
import 'package:weather/features/home/presentation/pages/widgets/hum_win_fee2.dart';
import 'package:weather/features/home/presentation/pages/widgets/main_info.dart';
import 'package:weather/features/home/presentation/pages/widgets/next_days.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_bloc.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_state.dart';
import 'package:weather/services/location/bloc/location_bloc.dart';
import 'package:weather/services/location/bloc/location_event.dart';
import 'package:weather/services/weather/bloc/weather_bloc.dart';
import 'package:weather/services/weather/bloc/weather_event.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';

class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  late LocationBloc _locationBloc;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _locationBloc = LocationBloc();
    _locationBloc.add(GetLocation());  }

  @override
  void dispose() {
    _locationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PopupBloc, PopupState>(
        listener: (context, popupState) {
          context.read<WeatherBloc>().add(GetWeatherForSelectedLocation());
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              return Scaffold(
                body: Stack(
                  children: [
                    Image.asset(Images.usa, fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * .08,
                        MediaQuery.of(context).size.height * .08,
                        MediaQuery.of(context).size.width * .08,
                        0,
                      ),
                      child: Column(
                        children: [
                          appBar(state, context),
                          dateInfo(context),
                          getIcon(state.weatherData.current.weatherCode, 100),
                          mainInfo(context, state),
                          humWinFee(state),
                          SizedBox(height: MediaQuery.of(context).size.height * .03),
                          nextDays(context, state),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is WeatherError) {
              return Center(
                child: Text('Xatolik: ${state.message}'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
