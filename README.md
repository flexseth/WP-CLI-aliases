# WP-CLI-aliases

> Useful shell-alias shortcuts for common [WP-CLI](https://wp-cli.org/) commands.
> Stop typing `wp plugin install` — just type `wppi`.

---

## Contents

- [Quick Install](#quick-install)
- [Alias Categories](#alias-categories)
- [Full Alias Reference](#full-alias-reference)
  - [Core](#core-wpc)
  - [Plugin](#plugin-wpp)
  - [Theme](#theme-wpt)
  - [Post](#post-wppo)
  - [User](#user-wpu)
  - [Option](#option-wpop)
  - [Database](#database-wpdb)
  - [Config](#config-wpcfg)
  - [Search-Replace](#search-replace-wpsr)
  - [Cache & Transients](#cache--transients-wpca--wptr)
  - [Cron](#cron-wpcr)
  - [Term](#term-wptm)
  - [Comment](#comment-wpcom)
  - [Media](#media-wpmdi)
  - [Rewrite](#rewrite-wprw)
  - [Role & Capabilities](#role--capabilities-wprl--wpcap)
  - [Scaffold](#scaffold-wpscaf)
  - [Package](#package-wppkg)
  - [Import / Export](#import--export-wpimp--wpexp)
  - [Eval](#eval-wpev)
- [Interactive Setup](#interactive-setup)
- [Managing Aliases](#managing-aliases-post-install)
- [Naming Convention](#naming-convention)
- [Shell Compatibility](#shell-compatibility)
- [Man Page](#man-page)

---

## Quick Install

```bash
# Clone the repo
git clone https://github.com/flexseth/WP-CLI-aliases.git
cd WP-CLI-aliases

# Option 1 — Install the popular set (recommended for first-time users)
./install.sh --popular

# Option 2 — Install everything
./install.sh --all

# Option 3 — Interactive wizard (pick categories)
./install.sh --interactive

# Reload your shell
source ~/.bashrc   # bash
source ~/.zshrc    # zsh
```

After installing, the `wp-aliases` command is available for exploration:

```bash
wp-aliases list                  # show all aliases
wp-aliases list --category plugin
wp-aliases categories            # browse categories
wp-aliases search cache          # find aliases by keyword
wp-aliases man                   # open the man page
```

---

## Alias Categories

| Category | Prefix | Description |
|---|---|---|
| [core](#core-wpc) | `wpc` | Download, install, update, verify WP core |
| [plugin](#plugin-wpp) | `wpp` | Install, activate, update, delete plugins |
| [theme](#theme-wpt) | `wpt` | Install, activate, update, delete themes |
| [post](#post-wppo) | `wppo` | Create, list, update, delete posts & meta |
| [user](#user-wpu) | `wpu` | Manage users, roles, meta |
| [option](#option-wpop) | `wpop` | Get, update, delete WP options |
| [db](#database-wpdb) | `wpdb` | Import, export, query, maintain the DB |
| [config](#config-wpcfg) | `wpcfg` | Manage wp-config.php |
| [search-replace](#search-replace-wpsr) | `wpsr` | Search-replace strings in the DB |
| [cache](#cache--transients-wpca--wptr) | `wpca` / `wptr` | Object cache & transients |
| [cron](#cron-wpcr) | `wpcr` | Manage WP-Cron events |
| [term](#term-wptm) | `wptm` | Manage taxonomy terms |
| [comment](#comment-wpcom) | `wpcom` | Manage comments & moderation |
| [media](#media-wpmdi) | `wpmdi` | Import media, regenerate thumbnails |
| [rewrite](#rewrite-wprw) | `wprw` | Flush and manage rewrite rules |
| [role](#role--capabilities-wprl--wpcap) | `wprl` / `wpcap` | Roles and capabilities |
| [scaffold](#scaffold-wpscaf) | `wpscaf` | Generate plugin/theme/CPT boilerplate |
| [package](#package-wppkg) | `wppkg` | WP-CLI community packages |
| [import-export](#import--export-wpimp--wpexp) | `wpimp` / `wpexp` | Content WXR import/export |
| [eval](#eval-wpev) | `wpev` | Execute PHP in WP context |

---

## Full Alias Reference

### Core (`wpc*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpcd` | `wp core download` | Download WordPress core files |
| `wpci` | `wp core install` | Install WordPress |
| `wpcu` | `wp core update` | Update WordPress core |
| `wpcudb` | `wp core update-db` | Update the database schema |
| `wpcv` | `wp core verify-checksums` | Verify core files against checksums |
| `wpcver` | `wp core version` | Show current WordPress version |
| `wpcinfo` | `wp core version --extra` | Show WP + PHP + MySQL versions |

---

### Plugin (`wpp*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wppi` | `wp plugin install` | Install a plugin |
| `wppia` | `wp plugin install --activate` | Install and activate a plugin |
| `wppa` | `wp plugin activate` | Activate a plugin |
| `wppaa` | `wp plugin activate --all` | Activate all plugins |
| `wppd` | `wp plugin deactivate` | Deactivate a plugin |
| `wppda` | `wp plugin deactivate --all` | Deactivate all plugins |
| `wppl` | `wp plugin list` | List all plugins |
| `wppla` | `wp plugin list --status=active` | List active plugins only |
| `wppli` | `wp plugin list --status=inactive` | List inactive plugins |
| `wpps` | `wp plugin status` | Show plugin status |
| `wppu` | `wp plugin update` | Update a plugin |
| `wppua` | `wp plugin update --all` | Update all plugins |
| `wppucl` | `wp plugin update --dry-run` | Check for updates (no changes) |
| `wppr` | `wp plugin delete` | Delete a plugin |
| `wppver` | `wp plugin get --field=version` | Get a plugin's installed version |
| `wpppath` | `wp plugin get --field=path` | Get a plugin's path |

---

### Theme (`wpt*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpti` | `wp theme install` | Install a theme |
| `wptia` | `wp theme install --activate` | Install and activate a theme |
| `wpta` | `wp theme activate` | Activate a theme |
| `wptl` | `wp theme list` | List all themes |
| `wpts` | `wp theme status` | Show theme status |
| `wptu` | `wp theme update` | Update a theme |
| `wptua` | `wp theme update --all` | Update all themes |
| `wptucl` | `wp theme update --dry-run` | Check for theme updates (no changes) |
| `wptr` | `wp theme delete` | Delete a theme |
| `wptver` | `wp theme get --field=version` | Get a theme's installed version |
| `wptpath` | `wp theme get --field=stylesheet_dir` | Get a theme's directory path |

---

### Post (`wppo*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wppoc` | `wp post create` | Create a post |
| `wppodraft` | `wp post create --post_status=draft` | Create a draft post |
| `wppog` | `wp post get` | Get post details |
| `wppol` | `wp post list` | List posts |
| `wppolist` | `wp post list --post_type=post` | List posts of type 'post' |
| `wppopages` | `wp post list --post_type=page` | List pages |
| `wppopub` | `wp post list --post_status=publish` | List published posts |
| `wppodrft` | `wp post list --post_status=draft` | List draft posts |
| `wppoe` | `wp post edit` | Edit a post in $EDITOR |
| `wppou` | `wp post update` | Update a post |
| `wppor` | `wp post delete` | Delete a post (to trash) |
| `wpporf` | `wp post delete --force` | Permanently delete a post |
| `wppomg` | `wp post meta get` | Get post meta value |
| `wppomu` | `wp post meta update` | Update post meta |
| `wppomr` | `wp post meta delete` | Delete post meta |
| `wppoml` | `wp post meta list` | List all meta for a post |

---

### User (`wpu*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpuc` | `wp user create` | Create a user |
| `wpucadm` | `wp user create --role=administrator` | Create an admin user |
| `wpug` | `wp user get` | Get user details |
| `wpul` | `wp user list` | List all users |
| `wpula` | `wp user list --role=administrator` | List administrators |
| `wpule` | `wp user list --role=editor` | List editors |
| `wpuu` | `wp user update` | Update a user |
| `wpupass` | `wp user update --user_pass=` | Update user password (append pass) |
| `wpur` | `wp user delete` | Delete a user |
| `wpurar` | `wp user add-role` | Add a role to a user |
| `wpurrr` | `wp user remove-role` | Remove a role from a user |
| `wpusetr` | `wp user set-role` | Set a user's role |
| `wpumg` | `wp user meta get` | Get user meta value |
| `wpumu` | `wp user meta update` | Update user meta |
| `wpuml` | `wp user meta list` | List user meta |
| `wpugen` | `wp user generate` | Generate dummy users |

---

### Option (`wpop*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpopg` | `wp option get` | Get an option value |
| `wpopurl` | `wp option get siteurl` | Get site URL |
| `wpopname` | `wp option get blogname` | Get site name |
| `wpopemail` | `wp option get admin_email` | Get admin email |
| `wpopa` | `wp option add` | Add a new option |
| `wpopu` | `wp option update` | Update an option |
| `wpopr` | `wp option delete` | Delete an option |
| `wpopl` | `wp option list` | List all options |
| `wpopaly` | `wp option list --autoload=yes` | List autoloaded options |
| `wpopaln` | `wp option list --autoload=no` | List non-autoloaded options |

---

### Database (`wpdb*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpdbc` | `wp db create` | Create the database |
| `wpdbd` | `wp db drop` | Drop the database |
| `wpdbrd` | `wp db drop --yes` | Drop without confirmation |
| `wpdbi` | `wp db import` | Import a SQL file |
| `wpdbe` | `wp db export` | Export the database |
| `wpdbets` | `wp db export --add-drop-table` | Export with DROP TABLE |
| `wpdbq` | `wp db query` | Execute a SQL query |
| `wpdbql` | `wp db cli` | Open interactive DB CLI |
| `wpdbo` | `wp db optimize` | Optimize database tables |
| `wpdbr` | `wp db repair` | Repair tables |
| `wpdbck` | `wp db check` | Check tables for errors |
| `wpdbcl` | `wp db clean` | Clean default data (dev) |
| `wpdbsize` | `wp db size` | Show DB/table sizes |
| `wpdbpfx` | `wp db prefix` | Show the table prefix |
| `wpdbsrch` | `wp db search` | Search the database |
| `wpdbreset` | `wp db reset --yes` | Drop and recreate the DB |

---

### Config (`wpcfg*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpcfgc` | `wp config create` | Generate wp-config.php |
| `wpcfgg` | `wp config get` | Get a constant/variable value |
| `wpcfgs` | `wp config set` | Set a constant/variable |
| `wpcfgd` | `wp config delete` | Delete a constant/variable |
| `wpcfgl` | `wp config list` | List all constants/variables |
| `wpcfgp` | `wp config path` | Print path to wp-config.php |
| `wpcfghas` | `wp config has` | Check if a key exists |
| `wpcfgsh` | `wp config shuffle-salts` | Refresh security salts |

---

### Search-Replace (`wpsr*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpsr` | `wp search-replace` | Search and replace in the DB |
| `wpsrd` | `wp search-replace --dry-run` | Preview changes (no writes) |
| `wpsrp` | `wp search-replace --precise` | Precise (not partial serialized) |
| `wpsrre` | `wp search-replace --regex` | Regex mode |
| `wpsrall` | `wp search-replace --all-tables` | All DB tables |
| `wpsrex` | `wp search-replace --export` | Export result as SQL |

---

### Cache & Transients (`wpca*` / `wptr*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpcaf` | `wp cache flush` | Flush the object cache |
| `wpcag` | `wp cache get` | Get a cache value |
| `wpcaa` | `wp cache add` | Add to cache |
| `wpcas` | `wp cache set` | Set a cache value |
| `wpcad` | `wp cache delete` | Delete a cache key |
| `wpcatype` | `wp cache type` | Show cache backend |
| `wptrf` | `wp transient delete --all` | Flush all transients |
| `wptrg` | `wp transient get` | Get a transient |
| `wptrs` | `wp transient set` | Set a transient |
| `wptrd` | `wp transient delete` | Delete a transient |
| `wptrl` | `wp transient list` | List all transients |

---

### Cron (`wpcr*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpcrl` | `wp cron event list` | List scheduled cron events |
| `wpcrr` | `wp cron event run` | Run a specific cron event |
| `wpcrc` | `wp cron event create` | Create a cron event |
| `wpcrd` | `wp cron event delete` | Delete a cron event |
| `wpcrn` | `wp cron event next` | Show next run time |
| `wpcrsl` | `wp cron schedule list` | List cron schedules |
| `wpcrt` | `wp cron test` | Test WP-Cron |
| `wpcrrun` | `wp cron event run --due-now` | Run all due events now |

---

### Term (`wptm*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wptmc` | `wp term create` | Create a term |
| `wptmg` | `wp term get` | Get term details |
| `wptml` | `wp term list` | List terms |
| `wptmtags` | `wp term list post_tag` | List all tags |
| `wptmcats` | `wp term list category` | List all categories |
| `wptmu` | `wp term update` | Update a term |
| `wptmr` | `wp term delete` | Delete a term |
| `wptmmg` | `wp term meta get` | Get term meta |
| `wptmmu` | `wp term meta update` | Update term meta |
| `wptmml` | `wp term meta list` | List term meta |
| `wptmgen` | `wp term generate` | Generate dummy terms |

---

### Comment (`wpcom*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpcomc` | `wp comment create` | Create a comment |
| `wpcomg` | `wp comment get` | Get comment details |
| `wpcoml` | `wp comment list` | List comments |
| `wpcomcnt` | `wp comment count` | Count comments |
| `wpcomu` | `wp comment update` | Update a comment |
| `wpcomapp` | `wp comment approve` | Approve a comment |
| `wpcomuna` | `wp comment unapprove` | Unapprove a comment |
| `wpcomsp` | `wp comment spam` | Mark as spam |
| `wpcomtrs` | `wp comment trash` | Trash a comment |
| `wpcomr` | `wp comment delete` | Delete a comment |
| `wpcomgen` | `wp comment generate` | Generate dummy comments |

---

### Media (`wpmdi*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpmdii` | `wp media import` | Import a file to the media library |
| `wpmdiif` | `wp media import --featured-image` | Import as featured image |
| `wpmdireg` | `wp media regenerate` | Regenerate thumbnails |
| `wpmdirall` | `wp media regenerate --all` | Regenerate all thumbnails |
| `wpmdiryep` | `wp media regenerate --all --yes` | Regenerate all (no prompt) |
| `wpmdiis` | `wp media image-size` | List registered image sizes |
| `wpmdil` | `wp post list --post_type=attachment` | List media attachments |

---

### Rewrite (`wprw*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wprwf` | `wp rewrite flush` | Flush rewrite rules (soft) |
| `wprwfh` | `wp rewrite flush --hard` | Hard flush (regenerates .htaccess) |
| `wprwl` | `wp rewrite list` | List rewrite rules |
| `wprws` | `wp rewrite structure` | Set permalink structure |

---

### Role & Capabilities (`wprl*` / `wpcap*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wprlc` | `wp role create` | Create a role |
| `wprll` | `wp role list` | List all roles |
| `wprld` | `wp role delete` | Delete a role |
| `wprlr` | `wp role reset` | Reset role capabilities |
| `wpcapa` | `wp cap add` | Add a capability to a role |
| `wpcapl` | `wp cap list` | List capabilities for a role |
| `wpcapr` | `wp cap remove` | Remove a capability from a role |

---

### Scaffold (`wpscaf*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpscafp` | `wp scaffold plugin` | Generate a plugin boilerplate |
| `wpscafpunit` | `wp scaffold plugin-tests` | Generate PHPUnit tests for plugin |
| `wpscaft` | `wp scaffold _s` | Generate _Underscores starter theme |
| `wpscafct` | `wp scaffold child-theme` | Generate a child theme |
| `wpscafthunit` | `wp scaffold theme-tests` | Generate PHPUnit tests for theme |
| `wpscafcpt` | `wp scaffold post-type` | Generate custom post type code |
| `wpscafx` | `wp scaffold taxonomy` | Generate custom taxonomy code |
| `wpscafbl` | `wp scaffold block` | Generate a Gutenberg block |

---

### Package (`wppkg*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wppkgi` | `wp package install` | Install a WP-CLI package |
| `wppkgl` | `wp package list` | List installed packages |
| `wppkgu` | `wp package update` | Update all packages |
| `wppkgr` | `wp package remove` | Remove a package |
| `wppkgbr` | `wp package browse` | Browse available packages |
| `wppkgp` | `wp package path` | Print packages directory path |

---

### Import / Export (`wpimp*` / `wpexp*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpimp` | `wp import` | Import content from WXR file |
| `wpimpa` | `wp import --authors=create` | Import, create missing authors |
| `wpimps` | `wp import --authors=skip` | Import, skip unknown authors |
| `wpexp` | `wp export` | Export content to WXR file |
| `wpexpa` | `wp export --all` | Export all content |
| `wpexpp` | `wp export --post_type=post` | Export posts only |
| `wpexppage` | `wp export --post_type=page` | Export pages only |
| `wpexppub` | `wp export --post_status=publish` | Export published content only |

---

### Eval (`wpev*`)

| Alias | WP-CLI Command | Description |
|---|---|---|
| `wpev` | `wp eval` | Execute PHP code in WP context |
| `wpevf` | `wp eval-file` | Execute a PHP file in WP context |
| `wpevurl` | `wp eval 'echo home_url();'` | Print home URL |
| `wpevpath` | `wp eval 'echo ABSPATH;'` | Print WordPress root path |
| `wpevmail` | `wp eval '…admin_email…'` | Print admin email |
| `wpevver` | `wp eval '…$wp_version…'` | Print WP version via PHP |
| `wpevis` | `wp eval '…is_multisite()…'` | Check if multisite |

---

## Interactive Setup

Run the guided wizard to select only the categories you need:

```bash
./setup.sh
# or
./install.sh --interactive
```

The wizard will:
1. Detect your shell config file (`~/.bashrc`, `~/.zshrc`, etc.)
2. Ask you to choose an install mode: Popular / All / Pick
3. If "Pick" — step through each category with a yes/no prompt
4. Write `source` lines to your shell config
5. Install the `wp-aliases` management command to `~/.local/bin/`

---

## Managing Aliases (post-install)

After installation the `wp-aliases` tool is available:

```bash
# List every alias
wp-aliases list

# List aliases for one category
wp-aliases list --category db
wp-aliases list --category popular

# Browse all categories
wp-aliases categories

# Search aliases by keyword
wp-aliases search plugin
wp-aliases search "search-replace"

# Open the man page
wp-aliases man
```

To add more categories later:

```bash
./install.sh --category cron
./install.sh --category scaffold
```

To remove all WP-CLI aliases from your shell config:

```bash
./install.sh --uninstall
```

---

## Naming Convention

All aliases follow a predictable pattern so they are easy to remember:

```
wp + [category-prefix] + [action-suffix]
```

### Category prefixes

| Prefix | WP-CLI Command |
|---|---|
| `wpc` | `wp core` |
| `wpp` | `wp plugin` |
| `wpt` | `wp theme` |
| `wppo` | `wp post` |
| `wpu` | `wp user` |
| `wpop` | `wp option` |
| `wpdb` | `wp db` |
| `wpcfg` | `wp config` |
| `wpsr` | `wp search-replace` |
| `wpca` | `wp cache` |
| `wptr` | `wp transient` |
| `wpcr` | `wp cron` |
| `wptm` | `wp term` |
| `wpcom` | `wp comment` |
| `wpmdi` | `wp media` |
| `wprw` | `wp rewrite` |
| `wprl` | `wp role` |
| `wpcap` | `wp cap` |
| `wpscaf` | `wp scaffold` |
| `wppkg` | `wp package` |
| `wpimp` | `wp import` |
| `wpexp` | `wp export` |
| `wpev` | `wp eval` |

### Action suffixes

| Suffix | Meaning |
|---|---|
| `i` | install |
| `a` | activate |
| `d` | deactivate |
| `l` | list |
| `u` | update |
| `c` | create |
| `g` | get |
| `r` | remove / delete |
| `s` | status / set |
| `f` | flush |
| `e` | export |
| `ck` | check / verify |
| `ver` | version |
| `ua` | update `--all` |
| `ia` | install `--activate` |

---

## Shell Compatibility

| Shell | Supported | Config File |
|---|---|---|
| bash | ✅ | `~/.bashrc` or `~/.bash_profile` |
| zsh | ✅ | `~/.zshrc` |
| sh / dash | ✅ | `~/.profile` |
| fish | ⚠️ | Fish uses `function` not `alias`; manual adaptation needed |

---

## Man Page

A Unix man page is included at `docs/wp-aliases.1`:

```bash
man ./docs/wp-aliases.1
# or (after install)
wp-aliases man
```

---

## License

[MIT](LICENSE)
