import 'package:flutter/material.dart';
import 'package:unidate/app/core/widgets/spacer.dart';
import 'package:unidate/app/modules/profile/views/setup/setup_profile.view.dart';

class AddPicturesView extends StatefulWidget {
  const AddPicturesView({super.key});

  @override
  _AddPicturesViewState createState() => _AddPicturesViewState();
}

class _AddPicturesViewState extends State<AddPicturesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Add Pictures'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile_picture.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement upload profile picture functionality.
            },
            child: const Text('Upload Profile Picture'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(
                6,
                (index) => Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/additional_picture.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement upload additional picture functionality.
            },
            child: const Text('Upload Additional Picture'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement save changes functionality.
            },
            child: const Text('Save Changes'),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(child: AvatarPicker()),
              HSpacer(12),
              Expanded(child: AvatarPicker()),
              HSpacer(12),
              Expanded(child: AvatarPicker()),
            ],
          ),
        ],
      ),
    );
  }
}
