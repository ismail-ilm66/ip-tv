import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../M3U_playlist/views/m3_u_playlist_view.dart';
class PlaylistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image.png'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Playlist content
          Center(
            child: Container(
              width: 600, // Adjusted width
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                children: [
                  Text(
                    'Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPlaylistItem(),
                      _buildPlaylistItem(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPlaylistItem(),
                      _buildPlaylistItem(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to HomeView
                        Get.off(() => M3UPlaylistView());
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Playlist'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xFFB1060F),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistItem() {
    return Container(
      width: 250, // Adjusted width for smaller size
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.delete, color: Color(0xFFB1060F)),
            onPressed: () {
              // Handle delete action
            },
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
