<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wp_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wp_database_user' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-svc.default.svc.cluster.local' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'tx3#K<[mtQO(PLT1=BKI+Iw{BX?r8}Z33c@w{[E8sPaIA3cqU|J|wT- ]nk))x3=' );
define( 'SECURE_AUTH_KEY',  '2.,h|=A8hF1zr#e^u--(G`;iKTl:BVsq(&E>Ky*re/v:,Mf]=QwlvU!T;}|0A;Ee' );
define( 'LOGGED_IN_KEY',    '7jwpT8x%wR:T~!}_VoM]?++hQZDv1Y2[^G%Nvh9bln5h:BBtp{T}VzegWVJGTca-' );
define( 'NONCE_KEY',        'RQWBAc;>%>-6fUu>jw])#W_+h&a8pkN8An<+O$rp99DKOsp&nF(v4RsH: igi$Kc' );
define( 'AUTH_SALT',        '57nAineZ`LMyt-N|0h{Nv VNdi,GJ+Y#+t{=u3w|`=_;7+!g`(Q{}O^XK$1>-=u:' );
define( 'SECURE_AUTH_SALT', '>6UC-OH*$*(e3)][;fZ{D/3XsKmq}(&!b4=P_bw/q 9q1S;G]~DG.LP=~u3&li]-' );
define( 'LOGGED_IN_SALT',   'oO TW)Heiy3muKrf,gb^E{aix{|+ivOYzzYYT`,0*ZQ<;Vw&`I:N?s(YsGhI%+!9' );
define( 'NONCE_SALT',       'cJ~d|h: G8Kom=`7e#`k]_;WKMp4ZF,<b@B!Kv*+N,l0Bg#04D!>_~j;cr~Ks+Vt' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

