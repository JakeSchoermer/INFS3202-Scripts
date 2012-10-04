#!/usr/bin/env ruby

$: << "." #Append Current Directory to Load Path 


require "csv"

class Athletes

  
  @athletes = []

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
  'AM'=>'Armenia',
  'AW'=>'Aruba',
  'AU'=>'Australia',
  'AT'=>'Austria',
  'AZ'=>'Azerbaijan',
  'BS'=>'Bahamas',
  'BH'=>'Bahrain',
  'BD'=>'Bangladesh',
  'BB'=>'Barbados',
  'BY'=>'Belarus',
  'BE'=>'Belgium',
  'BZ'=>'Belize',
  'BJ'=>'Benin',
  'BM'=>'Bermuda',
  'BT'=>'Bhutan',
  'BO'=>'Bolivia',
  'BA'=>'Bosnia And Herzegovina',
  'BW'=>'Botswana',
  'BV'=>'Bouvet Island',
  'BR'=>'Brazil',
  'IO'=>'British Indian Ocean Territory',
  'BN'=>'Brunei',
  'BUL'=>'Bulgaria',
  'BF'=>'Burkina Faso',
  'BI'=>'Burundi',
  'KH'=>'Cambodia',
  'CM'=>'Cameroon',
  'CA'=>'Canada',
  'CV'=>'Cape Verde',
  'KY'=>'Cayman Islands',
  'CF'=>'Central African Republic',
  'TD'=>'Chad',
  'CL'=>'Chile',
  'CN'=>'China',
  'CX'=>'Christmas Island',
  'CC'=>'Cocos (Keeling) Islands',
  'CO'=>'Columbia',
  'KM'=>'Comoros',
  'CG'=>'Congo',
  'CK'=>'Cook Islands',
  'CR'=>'Costa Rica',
  'CI'=>'Cote D\'Ivorie (Ivory Coast)',
  'HR'=>'Croatia (Hrvatska)',
  'CU'=>'Cuba',
  'CY'=>'Cyprus',
  'CZ'=>'Czech Republic',
  'CD'=>'Democratic Republic Of Congo (Zaire)',
  'DK'=>'Denmark',
  'DJ'=>'Djibouti',
  'DM'=>'Dominica',
  'DO'=>'Dominican Republic',
  'TP'=>'East Timor',
  'EC'=>'Ecuador',
  'EG'=>'Egypt',
  'SV'=>'El Salvador',
  'GQ'=>'Equatorial Guinea',
  'ER'=>'Eritrea',
  'EE'=>'Estonia',
  'ET'=>'Ethiopia',
  'FK'=>'Falkland Islands (Malvinas)',
  'FO'=>'Faroe Islands',
  'FJ'=>'Fiji',
  'FI'=>'Finland',
  'FRA'=>'France',
  'FX'=>'France, Metropolitan',
  'GF'=>'French Guinea',
  'PF'=>'French Polynesia',
  'TF'=>'French Southern Territories',
  'GA'=>'Gabon',
  'GM'=>'Gambia',
  'GE'=>'Georgia',
  'DE'=>'Germany',
  'GH'=>'Ghana',
  'GI'=>'Gibraltar',
  'GR'=>'Greece',
  'GL'=>'Greenland',
  'GD'=>'Grenada',
  'GP'=>'Guadeloupe',
  'GU'=>'Guam',
  'GT'=>'Guatemala',
  'GN'=>'Guinea',
  'GW'=>'Guinea-Bissau',
  'GY'=>'Guyana',
  'HT'=>'Haiti',
  'HM'=>'Heard And McDonald Islands',
  'HN'=>'Honduras',
  'HK'=>'Hong Kong',
  'HU'=>'Hungary',
  'IS'=>'Iceland',
  'IN'=>'India',
  'ID'=>'Indonesia',
  'IR'=>'Iran',
  'IQ'=>'Iraq',
  'IE'=>'Ireland',
  'IL'=>'Israel',
  'IT'=>'Italy',
  'JM'=>'Jamaica',
  'JP'=>'Japan',
  'JO'=>'Jordan',
  'KZ'=>'Kazakhstan',
  'KE'=>'Kenya',
  'KI'=>'Kiribati',
  'KW'=>'Kuwait',
  'KG'=>'Kyrgyzstan',
  'LA'=>'Laos',
  'LV'=>'Latvia',
  'LB'=>'Lebanon',
  'LS'=>'Lesotho',
  'LR'=>'Liberia',
  'LY'=>'Libya',
  'LI'=>'Liechtenstein',
  'LT'=>'Lithuania',
  'LU'=>'Luxembourg',
  'MO'=>'Macau',
  'MK'=>'Macedonia',
  'MG'=>'Madagascar',
  'MW'=>'Malawi',
  'MY'=>'Malaysia',
  'MV'=>'Maldives',
  'ML'=>'Mali',
  'MT'=>'Malta',
  'MH'=>'Marshall Islands',
  'MQ'=>'Martinique',
  'MR'=>'Mauritania',
  'MU'=>'Mauritius',
  'YT'=>'Mayotte',
  'MX'=>'Mexico',
  'FM'=>'Micronesia',
  'MD'=>'Moldova',
  'MC'=>'Monaco',
  'MN'=>'Mongolia',
  'MS'=>'Montserrat',
  'MA'=>'Morocco',
  'MZ'=>'Mozambique',
  'MM'=>'Myanmar (Burma)',
  'NA'=>'Namibia',
  'NR'=>'Nauru',
  'NP'=>'Nepal',
  'NL'=>'Netherlands',
  'AN'=>'Netherlands Antilles',
  'NC'=>'New Caledonia',
  'NZ'=>'New Zealand',
  'NI'=>'Nicaragua',
  'NE'=>'Niger',
  'NG'=>'Nigeria',
  'NU'=>'Niue',
  'NF'=>'Norfolk Island',
  'KP'=>'North Korea',
  'MP'=>'Northern Mariana Islands',
  'NO'=>'Norway',
  'OM'=>'Oman',
  'PK'=>'Pakistan',
  'PW'=>'Palau',
  'PA'=>'Panama',
  'PG'=>'Papua New Guinea',
  'PY'=>'Paraguay',
  'PE'=>'Peru',
  'PH'=>'Philippines',
  'PN'=>'Pitcairn',
  'PL'=>'Poland',
  'PT'=>'Portugal',
  'PR'=>'Puerto Rico',
  'QA'=>'Qatar',
  'RE'=>'Reunion',
  'RO'=>'Romania',
  'RU'=>'Russia',
  'RW'=>'Rwanda',
  'SH'=>'Saint Helena',
  'KN'=>'Saint Kitts And Nevis',
  'LC'=>'Saint Lucia',
  'PM'=>'Saint Pierre And Miquelon',
  'VC'=>'Saint Vincent And The Grenadines',
  'SM'=>'San Marino',
  'ST'=>'Sao Tome And Principe',
  'SA'=>'Saudi Arabia',
  'SN'=>'Senegal',
  'SC'=>'Seychelles',
  'SL'=>'Sierra Leone',
  'SG'=>'Singapore',
  'SK'=>'Slovak Republic',
  'SI'=>'Slovenia',
  'SB'=>'Solomon Islands',
  'SO'=>'Somalia',
  'ZA'=>'South Africa',
  'GS'=>'South Georgia And South Sandwich Islands',
  'KR'=>'South Korea',
  'ES'=>'Spain',
  'LK'=>'Sri Lanka',
  'SD'=>'Sudan',
  'SR'=>'Suriname',
  'SJ'=>'Svalbard And Jan Mayen',
  'SZ'=>'Swaziland',
  'SE'=>'Sweden',
  'CH'=>'Switzerland',
  'SY'=>'Syria',
  'TW'=>'Taiwan',
  'TJ'=>'Tajikistan',
  'TZ'=>'Tanzania',
  'TH'=>'Thailand',
  'TG'=>'Togo',
  'TK'=>'Tokelau',
  'TO'=>'Tonga',
  'TT'=>'Trinidad And Tobago',
  'TN'=>'Tunisia',
  'TR'=>'Turkey',
  'TM'=>'Turkmenistan',
  'TC'=>'Turks And Caicos Islands',
  'TV'=>'Tuvalu',
  'UG'=>'Uganda',
  'UA'=>'Ukraine',
  'AE'=>'United Arab Emirates',
  'UK'=>'United Kingdom',
  'USA'=>'United States',
  'UM'=>'United States Minor Outlying Islands',
  'UY'=>'Uruguay',
  'UZ'=>'Uzbekistan',
  'VU'=>'Vanuatu',
  'VA'=>'Vatican City (Holy See)',
  'VE'=>'Venezuela',
  'VN'=>'Vietnam',
  'VG'=>'Virgin Islands (British)',
  'VI'=>'Virgin Islands (US)',
  'WF'=>'Wallis And Futuna Islands',
  'EH'=>'Western Sahara',
  'WS'=>'Western Samoa',
  'YE'=>'Yemen',
  'YU'=>'Yugoslavia',
  'ZM'=>'Zambia',
  'ZW'=>'Zimbabwe'
  }

  
	def initialize


		filepath = "../data_source/Athlete.csv"

    rows = []

    CSV.foreach(filepath, :headers => true, :return_headers => true, :converters => :all) do |row|
      #puts row
      rows << row
    end
      @athletes = rows
  end

  def printAllRecords
    @athletes.each do |row|
      puts "#{row}"
    end
  end

  def getHeaders

    @athletes[0]

  end

  def printHeaders

    output = ""

    @athletes.each {|word|
      output += "#{word} "
    }

  end

  def getRecord(id)

    if id > 0
      @athletes[id]
    else
      throw "Invalid Record Id"
    end
  end

  def getFirstName id
    @athletes[id]["FirstName"]
  end

  def getLastName id
    @athletes[id]["LastName"]
  end

  def getDOB id
    @athletes[id]["DateofBirth"]
  end

  def getGender id
    gender = @athletes[id]["Gender"].to_s.downcase

    if gender == "male" || gender == "m"
      gender = "M"
    elsif gender == "female" || gender == "f"
      gender = "F"
    end

    gender


  end

  def getCountry id
    country = @athletes[id]["Country"]

    result = ""

    COUNTRY_CODES.each_key do |key|

      match = /#{key}/.match(country).to_s

      if match.size > 0
        #puts COUNTRY_CODES[key]
        result = COUNTRY_CODES[key]
      end

    end

    result

  end



  def writeOutput

    filepath = "../output/Athlete.csv"

    CSV.open(filepath, "wb") do |csv|


      @athletes.each_index {|index|
        if index >0
          csv << ["#{index}", getFirstName(index), getLastName(index), getDOB(index), getGender(index), getCountry(index)]
        end
      }


    end

  end




end