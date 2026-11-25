TV-POLSKA.EU - OSOBISTY AKTUALIZATOR PLAYLIST (WERSJA PILOTAZOWA)
=============================================================

CO TO ROBI
- pobiera indeks kanałów z https://tv-polska.eu/kanaly
- cyklicznie przegląda część kanałów i stopniowo kolejne strony archiwum (rotacja; bez obciążania całej strony naraz)
- szuka podstron filmów /film/ID-...
- odczytuje jawne MP4/HLS z HTML; w przypadku osadzonych odtwarzaczy próbuje yt-dlp
- nie pobiera ani nie kopiuje samych filmów
- zapisuje dwie playlisty i raport:
    wyniki/tv_polska_wszystkie.m3u8
    wyniki/tv_polska_turystyka.m3u8
    wyniki/raport.csv
    wyniki/brak_adresu.csv (filmy bez potwierdzonego publicznego MP4/HLS)
- pamięta sprawdzone materiały w wyniki/stan.json i unika duplikatów
- organizuje filmy w 12 grupach M3U (group-title), z miastem w tytule

OGRANICZENIA
- Pierwszą wersję przetestowano na lokalnych próbkach HTML (testy programu).
  Ze względu na ograniczenia sieciowe środowiska przygotowania NIE przetestowano
  w tej sesji pobierania prawdziwych MP4 z żywej strony TV-Polska.eu.
- Nie każda strona filmu musi zawierać bezpośredni MP4/HLS. Wiele nagrań ma
  osadzenia Vimeo, a wygenerowany adres może być czasowy lub wymagać nagłówków.
- Krótkotrwałe adresy z wygaśnięciem wcześniejszym niż 8 godzin są pomijane.
- Odtwarzacz M3U IPTV Browser może blokować media przez CORS niezależnie od skryptu.
- Jeśli portal zmieni HTML, selektory mogą wymagać aktualizacji.
- Format M3U pozwala na grupy, nie na hierarchiczne podfoldery.
- Respektuj zasady strony i prawa nadawców; nie publikuj filmów ani nie obchodź
  kontroli dostępu. Używaj wyłącznie jawnych, ogólnodostępnych odnośników.

WINDOWS 10/11
1. Zainstaluj Python 3.11+ (python.org), zaznacz dodanie do PATH.
2. Rozpakuj ZIP, otwórz jego folder i kliknij uruchom_windows.bat.
3. Sprawdź wyniki/raport.csv; jeżeli są rozpoznane media, załaduj M3U8 do
   swojego odtwarzacza. Pusty wynik oznacza brak wykrytych użytecznych źródeł.
4. Następne uruchomienia analizują kolejne kanały i zachowują historię.

GITHUB - AUTOMATYCZNE AKTUALIZOWANIE
1. Utwórz NOWE repozytorium GitHub i wgraj pliki z ZIP zachowując strukturę.
2. Wejdź w Settings > Actions > General > Workflow permissions.
   Wybierz Read and write permissions (jeżeli polityka repozytorium zezwala).
3. Wejdź w Actions > Aktualizuj TV Polska > Run workflow.
4. Po pierwszym powodzeniu użyj w odtwarzaczu URL:
   https://raw.githubusercontent.com/TWOJ_LOGIN/TWOJE_REPO/main/wyniki/tv_polska_wszystkie.m3u8
   https://raw.githubusercontent.com/TWOJ_LOGIN/TWOJE_REPO/main/wyniki/tv_polska_turystyka.m3u8
5. GitHub Actions jest skonfigurowany na 4 uruchomienia na dobę (UTC).
   GitHub może opóźniać harmonogram; nie jest to gwarantowany stały czas.
6. Zadbaj o zgodę na użycie publicznych linków w sposób zgodny z zasadami operatora.

REGIONY
- Lista przypisań w regiony.json to początkowy słownik, nie pełna geobaza.
- Nieznane miejscowości trafiają do 12 Kanały tematyczne i inne.
- Możesz ręcznie przepisać slug do właściwej grupy; kolejne sprawdzenie
  może zmienić grupę już zapamiętanego filmu po ponownym odczycie.

UWAGA DOTYCZĄCA TESTÓW
Uruchom: python -m unittest -v test_aktualizuj.py
Przykładowe pliki testowe używają fikcyjnych domen i nie trafiają do playlist.
