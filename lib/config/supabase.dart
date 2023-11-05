import 'package:supabase_flutter/supabase_flutter.dart';

late SupabaseClient supabase;

Future<void> supabaseInit() async {
  await Supabase.initialize(
      url: 'https://aiteibjggcyrnkwyvxii.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFpdGVpYmpnZ2N5cm5rd3l2eGlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk5NDM3MTMsImV4cCI6MjAwNTUxOTcxM30.dU3DuHn4pEs6IhWoKLA85tYier56RlvKkIKRktyXxjU');

  supabase = Supabase.instance.client;
}
