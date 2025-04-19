import 'package:audioplayers/audioplayers.dart' show AssetSource, AudioPlayer, PlayerMode, ReleaseMode;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SharedPreferences sharedPreferences;
  SettingController({required this.sharedPreferences});

  // Audio players
  final AudioPlayer _backgroundMusicPlayer = AudioPlayer();
  final AudioPlayer _soundEffectsPlayer = AudioPlayer();

  // SharedPreferences keys
  static const String _musicKey = 'music_enabled';
  static const String _soundKey = 'sound_enabled';
  static const String _musicVolumeKey = 'music_volume';
  static const String _soundVolumeKey = 'sound_volume';

  // Observables with saved state
  late RxBool isMusicOn;
  late RxBool isSoundOn;
  late RxDouble musicVolume;
  late RxDouble soundVolume;

  // Getters for audio players
  AudioPlayer get backgroundMusicPlayer => _backgroundMusicPlayer;
  AudioPlayer get soundEffectsPlayer => _soundEffectsPlayer;

  // Debug helper function
  void _log(String message) {
    debugPrint('🔊 AudioDebug: $message');
  }

  void _setupAudio() async {
    try {
      _log('Setting up audio...');
      await _initializeBackgroundMusic();
      await _initializeSoundEffects();
      _log('Audio setup complete');
    } catch (e) {
      _log('Error setting up audio: $e');
    }
  }

  Future<void> _initializeBackgroundMusic() async {
    try {
      _log('Initializing background music...');
      // First stop any currently playing audio
      await _backgroundMusicPlayer.stop();

      // Set properties
      await _backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
      await _backgroundMusicPlayer.setPlayerMode(PlayerMode.mediaPlayer);

      // Load source
      _log('Loading music asset...');
      try {
        await _backgroundMusicPlayer.setSource(AssetSource('audio/music.wav'));
        _log('Music asset loaded successfully');
      } catch (e) {
        _log('Error loading music asset: $e');
        return;
      }

      // Set volume
      await _backgroundMusicPlayer.setVolume(musicVolume.value);
      _log('Music volume set to: ${(musicVolume.value * 100).toInt()}%');
      await Future.delayed(Duration(milliseconds: 100)); // Wait to ensure volume is applied
      if (isMusicOn.value) {
        await _backgroundMusicPlayer.resume();
      }

      // Resume if enabled
      if (isMusicOn.value) {
        _log('Music is ON - starting playback');
        await _backgroundMusicPlayer.resume();
      } else {
        _log('Music is OFF - not starting playback');
      }
    } catch (e) {
      _log('Error in _initializeBackgroundMusic: $e');
    }
  }

  Future<void> _initializeSoundEffects() async {
    try {
      _log('Initializing sound effects...');
      await _soundEffectsPlayer.setReleaseMode(ReleaseMode.release);
      await _soundEffectsPlayer.setPlayerMode(PlayerMode.lowLatency);
      await _soundEffectsPlayer.setVolume(soundVolume.value);
      _log('Sound effects initialized');
    } catch (e) {
      _log('Error in _initializeSoundEffects: $e');
    }
  }

  void toggleMusic() {
    isMusicOn.value = !isMusicOn.value;
    sharedPreferences.setBool(_musicKey, isMusicOn.value);

    if (isMusicOn.value) {
      _log('Turning music ON');
      _backgroundMusicPlayer.resume().then((_) {
        _log('Music resumed');
      }).catchError((error) {
        _log('Error resuming music: $error');
        // Try to reload and start if resume fails
        _initializeBackgroundMusic();
      });
    } else {
      _log('Turning music OFF');
      _backgroundMusicPlayer.pause().then((_) {
        _log('Music paused');
      }).catchError((error) {
        _log('Error pausing music: $error');
      });
    }
  }

  void toggleSound() {
    isSoundOn.value = !isSoundOn.value;
    sharedPreferences.setBool(_soundKey, isSoundOn.value);

    if (isSoundOn.value) {
      _log('Turning sound ON');
      playSoundEffect();
    } else {
      _log('Turning sound OFF');
    }
  }

  void playSoundEffect() {
    if (isSoundOn.value) {
      _soundEffectsPlayer
          .play(AssetSource('audio/sound.wav'))
          .then((_) => _log('Sound effect played'))
          .catchError((error) => _log('Error playing sound effect: $error'));
    }
  }

  void setMusicVolume(double volume) {
    musicVolume.value = volume;
    sharedPreferences.setDouble(_musicVolumeKey, volume);
    _backgroundMusicPlayer.setVolume(volume);
    _log('Setting music volume to: ${(volume * 100).toInt()}%');

    if (volume <= 0.01) {
      _backgroundMusicPlayer.pause();
      _log('Volume is zero, pausing music');
    } else if (isMusicOn.value) {
      _backgroundMusicPlayer.resume();
      _log('Volume above zero, resuming music');
    }
  }


  void setSoundVolume(double value) {
    // Ensure value is properly clamped
    value = value.clamp(0.0, 1.0);

    _log('Setting sound volume to: ${(value * 100).toInt()}%');
    soundVolume.value = value;
    sharedPreferences.setDouble(_soundVolumeKey, value);

    _soundEffectsPlayer.setVolume(value).then((_) {
      _log('Sound volume applied');

      // Play a test sound if sound is enabled
      if (isSoundOn.value) {
        playSoundEffect();
      }
    }).catchError((error) {
      _log('Error setting sound volume: $error');
    });
  }

  // Added test function for debugging
  void testBackgroundMusic() {
    _log('Testing background music...');
    _log('Current state: Music ${isMusicOn.value ? "ON" : "OFF"}, Volume: ${(musicVolume.value * 100).toInt()}%');

    // Ensure music is loaded
    _backgroundMusicPlayer.stop().then((_) {
      _backgroundMusicPlayer.setSource(AssetSource('audio/music.wav')).then((_) {
        _backgroundMusicPlayer.setVolume(musicVolume.value).then((_) {
          _backgroundMusicPlayer.resume().then((_) {
            _log('Test playback started');
            isMusicOn.value = true;
            sharedPreferences.setBool(_musicKey, true);
          });
        });
      });
    }).catchError((error) {
      _log('Error in test music: $error');
    });
  }

  @override
  void onInit() {
    super.onInit();

    _log('Initializing settings controller');

    // Load saved settings with reasonable defaults
    isMusicOn = RxBool(sharedPreferences.getBool(_musicKey) ?? true);
    isSoundOn = RxBool(sharedPreferences.getBool(_soundKey) ?? true);
    musicVolume = RxDouble(sharedPreferences.getDouble(_musicVolumeKey) ?? 0.7);
    soundVolume = RxDouble(sharedPreferences.getDouble(_soundVolumeKey) ?? 0.7);

    _log('Settings loaded:');
    _log('- Music: ${isMusicOn.value ? "ON" : "OFF"} (${(musicVolume.value * 100).toInt()}%)');
    _log('- Sound: ${isSoundOn.value ? "ON" : "OFF"} (${(soundVolume.value * 100).toInt()}%)');

    // Use Future.delayed to prevent immediate async calls in onInit
    Future.delayed(Duration.zero, () {
      _setupAudio();
    });
  }

  @override
  void onClose() {
    _log('Disposing audio resources');
    _backgroundMusicPlayer.dispose();
    _soundEffectsPlayer.dispose();
    super.onClose();
  }
}