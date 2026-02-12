import 'package:blabla/ui/screens/ride_pref/widgets/bla_bottom.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';

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

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

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

  //build the Screen Widget

  Widget _buildForm({
    required IconData icon,
    required String txt,
    VoidCallback? onTab,
  }) {
    return InkWell(// to detect user pressing, execute the print and show it in termial, Also Inkwell show the Point cursor, gestdetector show nothing
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.iconLight),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                txt,
                style: TextStyle(fontSize: 16, color: BlaColors.textLight),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                    child: _buildForm(
                      icon: Icons.radio_button_unchecked,
                      txt:
                          departure?.name ??
                          "Departure", // beware of app crushing, if departure is null, it return Departure, if not null it get the name
                      onTab: () {
                        print(
                          'Departure works',
                        ); // TO make sure the Tab is worked
                      },
                    ),
                  ),
                  // swaping between
                  IconButton(
                    onPressed: _swaping,
                    icon: const Icon(Icons.swap_vert),
                    color: BlaColors.primary,
                  ),
                ],
              ),
              const Divider(height: 1), //devid line ____
              // Arrival
              _buildForm(
                icon: Icons.radio_button_unchecked,
                txt: arrival?.name ?? "Arrival",
                onTab: () {
                  print(' The Best :p ');
                },
              ),
              const Divider(height: 1),
              // Date Picker
              _buildForm(
                icon: Icons.calendar_month_outlined,
                txt: "Date",
                onTab: () {
                  print(' Not yet implement date ');
                },
              ),
              const Divider(height: 1),
              // Seat
              _buildForm(
                icon: Icons.person,
                txt: '1' ,
                onTab: () {
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
