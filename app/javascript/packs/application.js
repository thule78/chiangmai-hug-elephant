import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';



import { initAutocomplete } from '../plugins/init_autocomplete';
import {calculateTotalCost} from '../components/sum_cal';
import {calDepositCost} from '../components/deposit_cal'

calculateTotalCost();
calDepositCost();
