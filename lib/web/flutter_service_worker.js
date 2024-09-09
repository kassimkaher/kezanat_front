'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "6eea988b9512139db4e69a3e05b58b72",
"version.json": "a6fb22c89ecc53c428d32891db11f84a",
"index.html": "77598d7509b442c828501a0fe65ec99e",
"/": "77598d7509b442c828501a0fe65ec99e",
"main.dart.js": "9eb8976ae7e659f395e0a92662d53368",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "a13a9991fc029fd94eecbb5123a9ec47",
"assets/AssetManifest.json": "1c6036174077b91b50a7be4e2477baa4",
"assets/NOTICES": "b5c96f34a2125ffd702332e06db3a9d7",
"assets/FontManifest.json": "cbc350d8d72be507463aaee9b92d98da",
"assets/AssetManifest.bin.json": "0c58240346ad0735ef1091ff6053256c",
"assets/packages/lucide_icons/assets/lucide.ttf": "cd99999155263613d106aaea26ba3291",
"assets/packages/localization/test/assets/lang2/en_US.json": "b389499c34b7ee2ec98c62fe49e08fa0",
"assets/packages/localization/test/assets/lang2/pt_BR.json": "08e9b784a138126822761beec7614524",
"assets/packages/localization/test/assets/lang/en_US.json": "18804652fbce3b62aacb6cce6f572f3c",
"assets/packages/localization/test/assets/lang/pt_BR.json": "f999b93065fe17d355d1ac5dcc1ff830",
"assets/packages/eva_icons_flutter/lib/fonts/Eva-Icons.ttf": "a71dbd49ad4a52020638190e30ac52e0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "61e3ab0c66c1bde358b935c208f8109d",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/svg/mugrib.svg": "0c2524c661aee44a6643be3f7c5c6d07",
"assets/assets/svg/sunrise.svg": "af95b7dfbb958481f242455482b69e33",
"assets/assets/svg/quran.svg": "7a86b73b58472970bb47038693be0187",
"assets/assets/svg/zyara.svg": "60310852982f391dda8811db3c7f0963",
"assets/assets/svg/half_morning.svg": "abfc228884617458c199d2c4cda43c63",
"assets/assets/svg/home.svg": "dcf5951936dbaee8af00cead318b542d",
"assets/assets/svg/morning.svg": "7743c4e42e6e14f4af9413127d4ddaf2",
"assets/assets/svg/library.svg": "c2e6f07750915917b63e3266ece4430e",
"assets/assets/svg/shower.svg": "a7ab50103c22f6984a0a0f936f7756b7",
"assets/assets/svg/emsak.svg": "49e81b88ca5ff0411643fb676618c732",
"assets/assets/svg/aftermoon.svg": "5afa656b8755ec3259b0c9917e250000",
"assets/assets/svg/book.svg": "55e9de833a77acb0cb863ffbb98fc2d7",
"assets/assets/svg/relations.svg": "0101e8eb3d7c2741eda5febf08ac01eb",
"assets/assets/svg/beads.svg": "f47e517a792e033d4ddb938945ea66a9",
"assets/assets/svg/fajer.svg": "08b3e52bed75e77ef41bebeb7f9d5fb6",
"assets/assets/svg/half_night.svg": "dd04c92f8135581939a1ce0cdb380777",
"assets/assets/svg/muslim.svg": "7ab0d6ce72c460da54caf94884bf6ccd",
"assets/assets/svg/sunset.svg": "53d8a226e5287e7c2f52c505bc76d1a2",
"assets/assets/svg/quran3.svg": "dfea51f9bfbee40ee59174a94c96bf07",
"assets/assets/svg/besmallah.svg": "e9d97faef017aa31a8d46debd790c1c7",
"assets/assets/svg/night.svg": "c7374751525e761a11b2ffcc2b304c5e",
"assets/assets/svg/sunshine.svg": "8260b008f0a9251183fed4c23dd24d7d",
"assets/assets/svg/quran2.svg": "fce50568ea1189f3a718a5305e9e6c74",
"assets/assets/svg/decor.svg": "716cbc6f337f991948610753703b189e",
"assets/assets/svg/star.svg": "b41ad285936b331e7848c9d1c9e93a30",
"assets/assets/svg/dua.svg": "f47e13b4e95e615ef9272fbe3a32ed38",
"assets/assets/svg/reading.svg": "e2d9a53177329adbc4a1227ad2795845",
"assets/assets/svg/q3.svg": "5cfd7501e3550ef3a072c2a0d6201a5c",
"assets/assets/svg/q2.svg": "0abbb6c58993124b20267cd65be2636c",
"assets/assets/svg/q1.svg": "926d692edd272bb3b6d36c54a4204d34",
"assets/assets/svg/library1.svg": "96f3f5bff59fda1169470a6ffc662641",
"assets/assets/svg/munajat.svg": "78c63189cef6cc3ece41958b13aad8af",
"assets/assets/svg/prayer.svg": "a9a8ebba17dd6c34145ef8a782e121c2",
"assets/assets/images/fajer_n.JPG": "d4c0a991c4c180e8c00463dc3c1be832",
"assets/assets/images/bk.jpg": "d514f1c67c585a69f9ad92a97cdde629",
"assets/assets/images/emsak_n.JPG": "a43276a44a2bda043d952f9ae5a02415",
"assets/assets/images/sura_title.png": "c1e169625d530d209f23b99251ce7825",
"assets/assets/images/quran.png": "645e18e928acaa69f1a7345024df4df7",
"assets/assets/images/alqader.png": "e3e47a8ab19e5c5ea0cd5e5ff7f21d48",
"assets/assets/images/logo.png": "e6d8020e5be265f068dee313d7ca85fa",
"assets/assets/images/duhur_n.JPG": "7c66754a73eb331b0cbabf972aa86ea8",
"assets/assets/images/calendar.png": "01a17a6705e20685ba84089f20f61bdc",
"assets/assets/images/tas_light.jpg": "f53a9a235f2a05f0c9a459da5bf82421",
"assets/assets/images/mugrib_n.JPG": "3e500885e3c8dd7e91d75cf50c442d5b",
"assets/assets/images/tas_dark.jpg": "51be31684205934d81ff77abb9c77a45",
"assets/assets/docs/cites_n.json": "d6d1e6d6f4aa4429cad6e185113e742f",
"assets/assets/docs/alqadr.json": "103df9df3e437e326b34f694f0305839",
"assets/assets/docs/books/adhwaa_on_hussein_revolution_key.json": "fd586ee6e2ec0af421d01b34712452b4",
"assets/assets/docs/books/esool_alkafee_key.json": "629b88d6e63674f3bd181eb33df81a66",
"assets/assets/docs/books/nahjAlbalagahKey.json": "b47f14058867b8b2ab9e343eca659cbe",
"assets/assets/docs/books/sahefaAlsajadeaKey.json": "dd92740ef5edc364e33aa6404877e31c",
"assets/assets/docs/mufateh_aljynan.json": "23cecd75af2abccdd0a9fa5abf1f4bfb",
"assets/assets/docs/quran.json": "f2eed2c4c3ed7cfeb9430b29ceff9d4b",
"assets/assets/docs/dua/small_sahar.txt": "5d5e9ff0656fa51af1bf991d8eddb826",
"assets/assets/docs/dua/big_jushan.txt": "6c054cf0779c79916bb19652db041b10",
"assets/assets/docs/dua/eftitah.txt": "72fd61a921866332d80db24f9cb05679",
"assets/assets/docs/dua/alsmat.txt": "0c0c8fd1b5292b033e046fd7863721bc",
"assets/assets/docs/dua/kumail.txt": "de31ae5f02efbe2e964fe6b2bb6b46ed",
"assets/assets/docs/dua/albahaa.txt": "3a27259ccd0d61f1eefc990f2f565eb8",
"assets/assets/docs/dua/alnahea.txt": "dd56699f6dd6b8c47b3a422eaf9ef5cd",
"assets/assets/docs/dua/small_jushan.txt": "d096a149c8b20985a14972764ce9825c",
"assets/assets/docs/dua/alqsaa.txt": "3160f6042b0c511da78ba067044197dc",
"assets/assets/docs/dua/makarem_alahlak.txt": "4fa7d4444ff17543dea479d98e5e8dce",
"assets/assets/docs/dua/hamza_althmaly.txt": "c6e9fdaaf793aac1db132e6ceb10814b",
"assets/assets/docs/dua/altawasul.txt": "270b6c8991bdde7b92928846c9234d95",
"assets/assets/docs/dua/alnudba.txt": "01596d4e0cd824e6519455d80c5b83ef",
"assets/assets/docs/dua/sabah.txt": "cfa130e84ecb10a3819e48e6634ffda9",
"assets/assets/docs/dua/almujeer.txt": "80f992316d66999db2e444b610b1ec20",
"assets/assets/docs/dua/munajat_manduma.txt": "199d430b3c98d03b29a71c2474528ea7",
"assets/assets/lottie/dua.json": "6837bae4f1a8119c1e170bd7818e79ea",
"assets/assets/lottie/prayer.json": "b4a0dfbfec00289af7cbc0b8d04ed94c",
"assets/assets/lottie/quran3.json": "f241529bf34f8cf3d2d8f96b1d0cd8c6",
"assets/assets/lottie/logo.json": "d96d2419774d3a96080c1abbaf26f5f5",
"assets/assets/lottie/eftar.json": "3939c576bdecf713295c1753fa73bf7f",
"assets/assets/lottie/back.json": "b23124128838b04a7633ce3732ff3a45",
"assets/assets/lottie/play_pause.json": "82e0332aa5f82d92565804497d6ee005",
"assets/assets/fonts/am.ttf": "60b9f9d3674a0dd451e7a483edaafad3",
"assets/assets/fonts/basmala.otf": "88c7980e51561595e832b04cb6f3d8e4",
"assets/assets/fonts/hafs.ttf": "20ea8d0b1d03ce22b8b5d2958cca8b87",
"assets/assets/fonts/scheherazade/ScheherazadeNew-SemiBold.ttf": "ee8cfcf2511c3a41267fa0dc57ae2f53",
"assets/assets/fonts/scheherazade/ScheherazadeNew-Regular.ttf": "a05ba8241fd04baba762ca4871680cf1",
"assets/assets/fonts/somar/SomarSans-Regular.ttf": "594bdf6056fb143264005ae48c77ba2e",
"assets/assets/fonts/somar/SomarSans-Medium-edited.otf": "f59f318a13d8abffe020c989585f36a2",
"assets/assets/fonts/somar/SomarSans-Bold-edited.otf": "643c31df08eb40a8820285896444cd3b",
"assets/assets/fonts/authman.ttf": "32397346c04c8b1dcc2476d9fccf05e4",
"assets/assets/fonts/dywan.ttf": "13e134372f24ee9c6d5749d8d979d6ef",
"assets/assets/fonts/kufy.ttf": "1c70b988a345174b2284a98687bcb2e8",
"assets/assets/fonts/muhakik.ttf": "1f2108d10419fe3c2b56e6ddf2f05c88",
"assets/assets/sound/c1.mp3": "4de0e0d6dbc65ff7ee001a8346012ece",
"assets/assets/sound/salat.m4a": "74acde5d75c86eb47c185e7b68f5c535",
"assets/assets/sound/bead.wav": "7fc2a29315fe63582ddf1cb6436aebbe",
"assets/assets/sound/tick.MP3": "f349ccc6b64086cad66156b809a677a1",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
