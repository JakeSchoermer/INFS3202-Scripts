#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path


require "csv"

module Countries

  attr_accessor :COUNTRY_CODES

  COUNTRY_CODES = {
  'AFG'=>'Afghanistan',
  'ALB'=>'Albania',
  'ALG'=>'Algeria',
  'AS'=>'American Samoa',
  'AD'=>'Andorra',
  'AO'=>'Angola',
  'AI'=>'Anguilla',
  'AQ'=>'Antarctica',
  'AG'=>'Antigua And Barbuda',
  'AR'=>'Argentina',
  'ARG'=>'Argentina',
  'AM'=>'Armenia',
  'ARM'=>'Armenia',
  'AW'=>'Aruba',
  'AU'=>'Australia',
  'AUS'=>'Australia',
  'ANZ'=>'Australia',
  'AT'=>'Austria',
  'AUT'=>'Austria',
  'AZ'=>'Azerbaijan',
  'AZE'=>'Azerbaijan',
  'BS'=>'Bahamas',
  'BAH'=>'Bahamas',
  'BH'=>'Bahrain',
  'BRN'=>'Bahrain',
  'BD'=>'Bangladesh',
  'BB'=>'Barbados',
  'BAR'=>'Barbados',
  'BY'=>'Belarus',
  'BE'=>'Belgium',
  'BEL'=>'Belgium',
  'BIN'=>'India', #British India
  'BLR'=>'Belarus',
  'BZ'=>'Belize',
  'BJ'=>'Benin',
  'BM'=>'Bermuda',
  'BER'=>'Bermuda',
  'BT'=>'Bhutan',
  'BO'=>'Bolivia',
  'BA'=>'Bosnia And Herzegovina',
  'BW'=>'Botswana',
  'BOH'=>'Bohemia',
  'BV'=>'Bouvet Island',
  'BR'=>'Brazil',
  'BRA'=>'Brazil',
  'IO'=>'British Indian Ocean Territory',
  'BN'=>'Brunei',
  'BUL'=>'Bulgaria',
  'BF'=>'Burkina Faso',
  'BI'=>'Burundi',
  'BDI'=>'Burundi',
  'KH'=>'Cambodia',
  'CM'=>'Cameroon',
  'CMR'=>'Cameroon',
  'CA'=>'Canada',
  'CAN'=>'Canada',
  'CV'=>'Cape Verde',
  'KY'=>'Cayman Islands',
  'CF'=>'Central African Republic',
  'TD'=>'Chad',
  'CHI'=>'Chile',
  'CHN'=>'China',
  'CL'=>'Chile',
  'CN'=>'China',
  'CX'=>'Christmas Island',
  'CC'=>'Cocos (Keeling) Islands',
  'CO'=>'Columbia',
  'COL'=>'Columbia',
  'KM'=>'Comoros',
  'CG'=>'Congo',
  'CK'=>'Cook Islands',
  'CR'=>'Costa Rica',
  'CRC'=>'Costa Rica',
  'CI'=>'Cote D\'Ivorie (Ivory Coast)',
  'CIV'=>'Cote D\'Ivorie (Ivory Coast)',
  'HR'=>'Croatia (Hrvatska)',
  'CRO'=>'Croatia',
  'CU'=>'Cuba',
  'CUB'=>'Cuba',
  'CY'=>'Cyprus',
  'CZ'=>'Czech Republic',
  'CZR'=>'Czech Republic',
  'CZE'=>'Czech Republic',
  'CD'=>'Democratic Republic Of Congo (Zaire)',
  'DEN'=>'Denmark',
  'DK'=>'Denmark',
  'DJ'=>'Djibouti',
  'DJI'=>'Djibouti',
  'DM'=>'Dominica',
  'DO'=>'Dominican Republic',
  'DOM'=>'Dominican Republic',
  'TP'=>'East Timor',
  'EC'=>'Ecuador',
  'ECU'=>'Ecuador',
  'EG'=>'Egypt',
  'EGY'=>'Egypt',
  'SV'=>'El Salvador',
  'GQ'=>'Equatorial Guinea',
  'ER'=>'Eritrea',
  'ERI'=>'Eritrea',
  'EE'=>'Estonia',
  'EST'=>'Estonia',
  'ET'=>'Ethiopia',
  'ETH'=>'Ethiopia',
  'ESP'=>'Spain',
  'FK'=>'Falkland Islands (Malvinas)',
  'FO'=>'Faroe Islands',
  'FJ'=>'Fiji',
  'FI'=>'Finland',
  'FIN'=>'Finland',
  'FRA'=>'France',
  'FRG'=>'Germany',
  'FX'=>'France, Metropolitan',
  'GF'=>'French Guinea',
  'PF'=>'French Polynesia',
  'TF'=>'French Southern Territories',
  'GA'=>'Gabon',
  'GM'=>'Gambia',
  'GE'=>'Georgia',
  'GEO'=>'Georgia',
  'DE'=>'Germany',
  'DEU'=>'Germany',
  'GBR'=>'United Kingdom',
  'GDR'=>'Germany',
  'GER'=>'Georgia',
  'GER'=>'Germany',
  'GH'=>'Ghana',
  'GHA'=>'Ghana',
  'GI'=>'Gibraltar',
  'GR'=>'Greece',
  'GRE'=>'Greece',
  'GL'=>'Greenland',
  'GD'=>'Grenada',
  'GP'=>'Guadeloupe',
  'GU'=>'Guam',
  'GUY'=>'Guyana',
  'GT'=>'Guatemala',
  'GN'=>'Guinea',
  'GW'=>'Guinea-Bissau',
  'GY'=>'Guyana',
  'HAI'=>'Haiti',
  'HT'=>'Haiti',
  'HM'=>'Heard And McDonald Islands',
  'HN'=>'Honduras',
  'HK'=>'Hong Kong',
  'HKG'=>'Hong Kong',
  'HU'=>'Hungary',
  'HUN'=>'Hungary',
  'ICE'=>'Indonesia',
  'IS'=>'Iceland',
  'IN'=>'India',
  'IND'=>'India',
  'IRI'=>'Iran',
  'ID'=>'Indonesia',
  'INA'=>'Indonesia',
  'IR'=>'Iran',
  'IQ'=>'Iraq',
  'IRQ'=>'Iraq',
  'IE'=>'Ireland',
  'IRL'=>'Ireland',
  'IL'=>'Israel',
  'ISR'=>'Israel',
  'IT'=>'Italy',
  'ITA'=>'Italy',
  'JM'=>'Jamaica',
  'JAM'=>'Jamaica',
  'JP'=>'Japan',
  'JPN'=>'Japan',
  'JO'=>'Jordan',
  'KZ'=>'Kazakhstan',
  'KAZ'=>'Kazakhstan',
  'KE'=>'Kenya',
  'KEN'=>'Kenya',
  'KI'=>'Kiribati',
  'KW'=>'Kuwait',
  'KUW'=>'Kuwait',
  'KG'=>'Kyrgyzstan',
  'KGZ'=>'Kyrgyzstan',
  'LA'=>'Laos',
  'LV'=>'Latvia',
  'LAT'=>'Latvia',
  'LB'=>'Lebanon',
  'LIB'=>'Lebanon',
  'LS'=>'Lesotho',
  'LR'=>'Liberia',
  'LY'=>'Libya',
  'LI'=>'Liechtenstein',
  'LIE'=>'Liechtenstein',
  'LT'=>'Lithuania',
  'LTU'=>'Lithuania',
  'LU'=>'Luxembourg',
  'LUX'=>'Luxembourg',
  'MO'=>'Macau',
  'MK'=>'Macedonia',
  'MKD'=>'Macedonia',
  'MG'=>'Madagascar',
  'MW'=>'Malawi',
  'MY'=>'Malaysia',
  'MAS'=>'Malaysia',
  'MV'=>'Maldives',
  'ML'=>'Mali',
  'MT'=>'Malta',
  'MH'=>'Marshall Islands',
  'MQ'=>'Martinique',
  'MR'=>'Mauritania',
  'MU'=>'Mauritius',
  'MRI'=>'Mauritius',
  'YT'=>'Mayotte',
  'MX'=>'Mexico',
  'MEX'=>'Mexico',
  'FM'=>'Micronesia',
  'MD'=>'Moldova',
  'MDA'=>'Moldova',
  'MC'=>'Monaco',
  'MON'=>'Monaco',
  'MN'=>'Mongolia',
  'MGL'=>'Mongolia',
  'MS'=>'Montserrat',
  'MA'=>'Morocco',
  'MAR'=>'Morocco',
  'MZ'=>'Mozambique',
  'MOZ'=>'Mozambique',
  'MM'=>'Myanmar (Burma)',
  'NA'=>'Namibia',
  'NAM'=>'Namibia',
  'NED'=>'Netherlands',
  'NR'=>'Nauru',
  'NP'=>'Nepal',
  'NL'=>'Netherlands',
  'AN'=>'Netherlands Antilles',
  'AHO'=>'Netherlands Antilles',
  'NC'=>'New Caledonia',
  'NZ'=>'New Zealand',
  'NZL'=>'New Zealand',
  'NI'=>'Nicaragua',
  'NE'=>'Niger',
  'NG'=>'Nigeria',
  'NIG'=>'Nigeria',
  'NGR'=>'Nigeria',
  'NU'=>'Niue',
  'NF'=>'Norfolk Island',
  'KP'=>'North Korea',
  'PRK'=>'North Korea',
  'MP'=>'Northern Mariana Islands',
  'NO'=>'Norway',
  'NOR'=>'Norway',
  'OM'=>'Oman',
  'PAK'=>'Pakistan',
  'PK'=>'Pakistan',
  'PW'=>'Palau',
  'PA'=>'Panama',
  'PAN'=>'Panama',
  'PG'=>'Papua New Guinea',
  'PY'=>'Paraguay',
  'PAR'=>'Paraguay',
  'PE'=>'Peru',
  'PER'=>'Peru',
  'PH'=>'Philippines',
  'PHI'=>'Philippines',
  'PN'=>'Pitcairn',
  'PL'=>'Poland',
  'POL'=>'Poland',
  'PT'=>'Portugal',
  'POR'=>'Portugal',
  'PR'=>'Puerto Rico',
  'PUR'=>'Puerto Rico',
  'QA'=>'Qatar',
  'QAT'=>'Qatar',
  'RE'=>'Reunion',
  'RO'=>'Romania',
  'ROM'=>'Romania',
  'RU'=>'Russia',
  'RUS'=>'Russia',
  'RW'=>'Rwanda',
  'SH'=>'Saint Helena',
  'KN'=>'Saint Kitts And Nevis',
  'LC'=>'Saint Lucia',
  'PM'=>'Saint Pierre And Miquelon',
  'VC'=>'Saint Vincent And The Grenadines',
  'SM'=>'San Marino',
  'ST'=>'Sao Tome And Principe',
  'SA'=>'Saudi Arabia',
  'KSA'=>'Saudi Arabia',
  'SAF'=>'South Africa',
  'SN'=>'Senegal',
  'SEN'=>'Senegal',
  'SC'=>'Seychelles',
  'SL'=>'Sierra Leone',
  'SG'=>'Singapore',
  'SIN'=>'Singapore',
  'SK'=>'Slovak Republic',
  'SVK'=>'Slovak Republic',
  'SLO'=>'Slovak Republic',
  'SI'=>'Slovenia',
  'SB'=>'Solomon Islands',
  'SO'=>'Somalia',
  'ZA'=>'South Africa',
  'RSA'=>'South Africa',
  'GS'=>'South Georgia And South Sandwich Islands',
  'KOR'=>'South Korea',
  'KR'=>'South Korea',
  'ES'=>'Spain',
  'LK'=>'Sri Lanka',
  'SRI'=>'Sri Lanka',
  'SD'=>'Sudan',
  'SUD'=>'Sudan',
  'SR'=>'Suriname',
  'SUR'=>'Suriname',
  'SJ'=>'Svalbard And Jan Mayen',
  'SUI'=>'Switzerland',
  'SZ'=>'Swaziland',
  'SE'=>'Sweden',
  'SRB'=>'Serbia',
  'SWE'=>'Sweden',
  'CH'=>'Switzerland',
  'SY'=>'Syria',
  'SYR'=>'Syria',
  'TW'=>'Taiwan',
  'TPE'=>'Taiwan',
  'TJ'=>'Tajikistan',
  'TJK'=>'Tajikistan',
  'TZ'=>'Tanzania',
  'TAN'=>'Tanzania',
  'TH'=>'Thailand',
  'THA'=>'Thailand',
  'TG'=>'Togo',
  'TOG'=>'Togo',
  'TK'=>'Tokelau',
  'TO'=>'Tonga',
  'TGA'=>'Tonga',
  'TT'=>'Trinidad And Tobago',
  'TRI'=>'Trinidad And Tobago',
  'TN'=>'Tunisia',
  'TUN'=>'Tunisia',
  'TR'=>'Turkey',
  'TUR'=>'Turkey',
  'TM'=>'Turkmenistan',
  'TC'=>'Turks And Caicos Islands',
  'TV'=>'Tuvalu',
  'UG'=>'Uganda',
  'UGA'=>'Uganda',
  'UA'=>'Ukraine',
  'UKR'=>'Ukraine',
  'AE'=>'United Arab Emirates',
  'UAE'=>'United Arab Emirates',
  'UK'=>'United Kingdom',
  'USA'=>'United States',
  'URS'=>'Russia',
  'UM'=>'United States Minor Outlying Islands',
  'UY'=>'Uruguay',
  'URU'=>'Uruguay',
  'UZ'=>'Uzbekistan',
  'UZB'=>'Uzbekistan',
  'VU'=>'Vanuatu',
  'VA'=>'Vatican City (Holy See)',
  'VE'=>'Venezuela',
  'VEN'=>'Venezuela',
  'VN'=>'Vietnam',
  'VG'=>'Virgin Islands (British)',
  'VI'=>'Virgin Islands (US)',
  'ISV'=>'Virgin Islands',
  'VIE'=>'Vietnam',
  'WF'=>'Wallis And Futuna Islands',
  'EH'=>'Western Sahara',
  'WS'=>'Western Samoa',
  'YE'=>'Yemen',
  'YU'=>'Yugoslavia',
  'YUG'=>'Yugoslavia',
  'YUF'=>'Yugoslavia',
  'ZM'=>'Zambia',
  'ZAM'=>'Zambia',
  'ZW'=>'Zimbabwe',
  'ZIM'=>'Zimbabwe'
  }


  def getCountryFromCode code

    COUNTRY_CODES[code]
  end

end