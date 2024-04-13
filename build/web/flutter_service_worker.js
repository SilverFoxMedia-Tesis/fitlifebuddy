'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "978e81bd7c39eb142adc8f7df8e58eb5",
"assets/AssetManifest.json": "1655f9a20357a41300557a2e5f8ea7f3",
"assets/assets/icons/edit.svg": "c069760437e214e9d23f2053fa3c5eb8",
"assets/assets/icons/help.svg": "5e935512b9713f898bf17b68a73cd67b",
"assets/assets/icons/home.svg": "9c2433253821acfac0044c19c755874e",
"assets/assets/icons/logo.svg": "d4bb029136e4efc50a5be5bdd0407088",
"assets/assets/icons/notification.svg": "ccd4d2561a03e27742efc41dd1f05bd6",
"assets/assets/icons/person.svg": "72661019c44d3cd956a48cf5118fb616",
"assets/assets/icons/plus.svg": "13cf47e6620181bcd6158f844320c0a2",
"assets/assets/icons/settings.svg": "ac929291f9087250ae132f635b04c70f",
"assets/assets/icons/trash.svg": "3e369a7878763e09c418045996ee5ff6",
"assets/assets/images/card.png": "43efc0d3c4e6d61315dddc6753516788",
"assets/assets/images/card2.png": "9bf244ae1369aa4d0adc16501bddecd9",
"assets/assets/images/card3.png": "75900f8025ca71b76a454b7cd683a96a",
"assets/assets/images/card4.png": "4731a18fba664d1c9c6e5889baa29d57",
"assets/assets/images/cover_photo.png": "30d3cf5d2f2d8b127b4de52db4e41cce",
"assets/assets/images/days.png": "ed2b955a610ba2b3c7f843f4668f8427",
"assets/assets/images/exercise1.png": "074fb4d70cd357fa47a7a3a9b2b7fa01",
"assets/assets/images/exercise2.png": "d55ee2bc87d5e09a4b47a7fb4969959e",
"assets/assets/images/exercise3.png": "496262f58f24847e0dd3f829e919d2b8",
"assets/assets/images/exercise4.png": "03f4aa1fa4fa77b58de6b75d2a55af06",
"assets/assets/images/exercise5.png": "e1b1a9b62e904f96f100a51291b92960",
"assets/assets/images/exercise6.png": "d7f743d5000da20d763c0158a75ab88f",
"assets/assets/images/food1.png": "015e281345fd0ec7e99bf265e5afb4b2",
"assets/assets/images/food2.png": "78cf64fbea1ecc832e1cb6f598c7fcb9",
"assets/assets/images/food3.png": "c9d49a8b0ec417849e848df9bc07e5e3",
"assets/assets/images/meal1.png": "584b3bda10d37f4c2f07baccb2bb4674",
"assets/assets/images/meal2.png": "638a590072f12b6d881b6961c5094db3",
"assets/assets/images/meal3.png": "d1099dc8964fd7cf8d95a5904500a62f",
"assets/assets/images/meal4.png": "1c276d4247d5148ab3fb72fc415691c3",
"assets/assets/images/meal5.png": "952eb4a874cbaf5e21b9e2c997ecf523",
"assets/assets/images/meal6.png": "77f7207c1c793598d91d283ac0df2da3",
"assets/assets/languages/es_PE.json": "ce819739fc150536fb768232aa497855",
"assets/FontManifest.json": "7df10702a8c60a62e6694f43081d46e7",
"assets/fonts/MaterialIcons-Regular.otf": "139cd42c57cbaf6fe724e1d1fe42ecbe",
"assets/NOTICES": "49fb9ba91ea918e2d9192371a7a0fb90",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "83c878235f9c448928034fe5bcba1c8a",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "885be8539995fdc157eb99139ed4a465",
"/": "885be8539995fdc157eb99139ed4a465",
"main.dart.js": "88a9e4f83f6eb2a74efc3b157d797cd8",
"manifest.json": "ae411d4f84ccce645da46b3309048bef",
"version.json": "8b34bc3e5b8875cce717cd7e834b4837"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
