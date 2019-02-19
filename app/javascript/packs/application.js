// import "bootstrap";
import './storage/index';
import './message/index';
import './message/show';
import './booking/index';

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import {initAutocomplete} from '../plugins/init_autocomplete'
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
initAutocomplete()
