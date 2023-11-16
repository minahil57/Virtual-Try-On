import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

late SupabaseClient supabase;

Future<void> supabaseInit() async {
  try {
    await Supabase.initialize(
        url: 'https://amutkupqlkgrlqhvzntb.supabase.co',
        anonKey:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFtdXRrdXBxbGtncmxxaHZ6bnRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkyNTI0MTYsImV4cCI6MjAxNDgyODQxNn0.RvjXkChKEWQnuAOZuPf4Mi0pxh2qdC0gtU_1dT3QhTA');

    supabase = Supabase.instance.client;
  } catch (e) {
    print(e);
    showToast('An error occured in DB intialization');
  }
}
