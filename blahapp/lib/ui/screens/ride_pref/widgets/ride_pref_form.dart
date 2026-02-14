import 'package:blabla/dummy_data/dummy_data.dart';
import 'package:blabla/ui/widgets/actions/bla_bottom.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../utils/date_time_util.dart';
import '../../../../utils/animations_util.dart';
import '../../../../ui/widgets/inputs/bla_location_picker.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import 'ride_prefs_input.dart'; // added import

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;
  // Based on Teacher Code

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departure = widget.initRidePref?.departure ?? fakeLocations[0];
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    arrival = widget.initRidePref?.arrival ?? fakeLocations[1];
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  void onDeparturePressed() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: departure),
      ),
    );
    if (selectedLocation != null) {
      // Update the deparure if not null
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  void onArrivalPressed() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: arrival),
      ),
    );
    if (selectedLocation != null) {              // Update the arrival if not null
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  String get departureLabel =>
      departure != null ? departure!.name : "Leaving from";
  String get arrivalLabel => arrival != null ? arrival!.name : "Going to";

  bool get showDeparturePLaceHolder => departure == null;
  bool get showArrivalPLaceHolder => arrival == null;

  String get dateLabel => DateTimeUtils.formatDateTime(departureDate);
  String get numberLabel => requestedSeats.toString();

  bool get switchVisible => arrival != null && departure != null;


  void _swaping() {
    // for swap the location
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    // to expended between IconBotton (Swaping) and Departure (take most part)
                    // departure form
                    child: RidePrefsInput(
                      icon: Icons.location_on,
                      txt: departureLabel,
                      isPlaceholder: showDeparturePLaceHolder,
                      onTap: onDeparturePressed,
                    ),
                  ),
                  // swaping between
                  switchVisible
                      ? IconButton(
                          onPressed: _swaping,
                          icon: const Icon(Icons.swap_vert),
                          color: BlaColors.primary,
                        )
                      : const SizedBox(width: 48),
                ],
              ),
              const Divider(height: 1), //devid line ____
              // Arrival
              RidePrefsInput(
                icon: Icons.location_on,
                txt: arrivalLabel,
                isPlaceholder: showArrivalPLaceHolder,
                onTap: onArrivalPressed,
              ),
              const Divider(height: 1),
              // Date Picker
              RidePrefsInput(
                icon: Icons.calendar_month_outlined,
                txt: dateLabel,
                onTap: () {
                  print(' Not yet implement date ');
                },
              ),
              const Divider(height: 1,),
              // Seat
              RidePrefsInput(
                icon: Icons.person,
                txt: numberLabel,
                onTap: () {
                  print(' Not yet implement Seat ');
                },
              ),
              BlaBottom(
                label: "Search",
                icon: null,
                isPrimary: true,
                onPressed: () {
                  print('Search');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
