use strict;
use warnings;

use Hatenaapiauth;

my $app = Hatenaapiauth->apply_default_middlewares(Hatenaapiauth->psgi_app);
$app;

