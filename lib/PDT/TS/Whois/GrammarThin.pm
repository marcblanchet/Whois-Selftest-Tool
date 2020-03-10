package PDT::TS::Whois::GrammarThin;
use utf8;
use strict;
use warnings;
use 5.014;

use YAML::Syck;

=head1 NAME

PDT::TS::Whois::GrammarThin - A data representation for Thin Registries of the ICANN Whois specification

=cut

require Exporter;

our @ISA       = 'Exporter';
our @EXPORT_OK = qw( $grammarThin );

=head1 EXPORTS

=head2 $grammarThin

A set of rules represented by a HASHREF.  Each key-value-pair in the HASHREF
represents a rule.

Rules are represented by key-value-pairs where the key (string) is the rule
name.

There are two types of rule values:

=over 4

=item Sequence rule

Represented by an ARRAYREF.  Each element represents a subrule using a single-
key-value-pair HASHREF.

=item Choice rule

Represented by a HASHREF.  Each key-value-pair represents a subrule.

=back

Subrules are represented by key-value-pairs where the key (string) is the
subrule name and the value (HASHREF).

There are two types of subrules:

=over 4

=item Line rules

Represented by a HASHREF with a 'line' key.

=item Section rules

Represented by a HASHREF without a 'line' key.

=back

A subrule value HASHREF may have the following keys:

=over 4

=item quantifier

Values: 'required' | 'required-strict' | 'optional-free' |
        'optional-not-empty' | 'optional-constrained' | 'empty-constrained' |
        'omitted-constrained' | /repeatable (max \d+)?/ |
        /optional-repeatable (max \d+)?/ (default: required)

=item line

Values: 'any line'|'awip line'|'empty line'|'field'|'last update line'|'multiple
name servers line'|'non-empty line'|'roid line'.

'any line' is a special wildcard value matching any one of the other line types.

=item type

Values: string

Specifies the type name that the field value must match. Only applicable if this
subrule contains line => 'field'.

=back

=cut

our $grammarThin = LoadFile( *DATA );

1;

__DATA__
---
Domain Name Object query:
  - Domain name reply: { }
Name Server Object query:
  Name server reply type 1: { }
  Name server reply type 2: { }
Registrar Object query:
  - Registrar reply: { }
Domain name reply:
  - Domain name details section: { }
  - Domain name subsection 1: { quantifier: optional-free }
  - Empty line: { quantifier: repeatable max 3, line: empty line }
  - AWIP footer: { }
  - Legal disclaimer: { }
Domain name subsection 1:
  Last updated footer: { }
  Domain name subsection 2: { }
Domain name subsection 2:
  - Empty line: { line: empty line }
  - Domain name subsection 3: { }
Domain name subsection 3:
  Domain name subsection 4: { }
  Last updated subsection 1: { }
Domain name subsection 4:
  - Domain name details section: { }
  - Domain name subsection 5: { }
Domain name subsection 5:
  Last updated footer: { }
  Domain name subsection 2: { }
Registrar reply:
  - Registrar details section: { }
  - Registrar subsection 1: { quantifier: optional-free }
  - Empty line: { quantifier: repeatable max 3, line: empty line }
  - AWIP footer: { quantifier: optional-free }
  - Legal disclaimer: { }
Registrar subsection 1:
  Last updated footer: { }
  Registrar subsection 2: { }
Registrar subsection 2:
  - Empty line: { line: empty line }
  - Registrar subsection 3: { }
Registrar subsection 3:
  Registrar subsection 4: { }
  Last updated subsection 1: { }
Registrar subsection 4:
  - Registrar details section: { }
  - Registrar subsection 5: { }
Registrar subsection 5:
  Last updated footer: { }
  Registrar subsection 2: { }
Name server reply type 1:
  - Name server details section: { }
  - Name server subsection 1: { quantifier: optional-free }
  - Empty line: { quantifier: repeatable max 3, line: empty line }
  - AWIP footer: { quantifier: optional-free }
  - Legal disclaimer: { }
Name server details section:
  - Server Name: { line: field, type: query name server }
  - IP Address: { quantifier: optional-repeatable, line: field, type: query name server ip }
  - Registrar: { quantifier: optional-constrained, line: field, type: postal line }
  - Registrar WHOIS Server: { quantifier: optional-constrained, line: field, type: hostname }
  - Registrar URL: { quantifier: optional-constrained, line: field, type: http url }
  - Additional field: { quantifier: optional-repeatable, line: field, keytype: name server object additional field key }
Name server subsection 1:
  Last updated footer: { }
  Name server subsection 2: { }
Name server subsection 2:
  - Empty line: { line: empty line }
  - Name server subsection 3: { }
Name server subsection 3:
  Name server subsection 4: { }
  Last updated subsection 1: { }
Name server subsection 4:
  - Name server details section: { }
  - Name server subsection 5: { }
Name server subsection 5:
  Last updated footer: { }
  Name server subsection 2: { }
Name server reply type 2:
  - Multiple name servers section: { }
  - Empty line: { quantifier: optional-repeatable max 3, line: empty line }
  - Last updated footer: { }
  - Empty line: { quantifier: repeatable max 3, line: empty line }
  - AWIP footer: { quantifier: optional-free }
  - Legal disclaimer: { }
Registrar details section:
  - Registrar: { line: field, type: query registrar name }
  - Street: { line: field, type: postal line, quantifier: repeatable }
  - City: { line: field, type: postal line }
  - State/Province: { quantifier: optional-constrained, line: field, type: postal line }
  - Postal Code: { quantifier: optional-constrained, line: field, type: postal code }
  - Country: { line: field, type: country code }
  - Phone number section: { quantifier: repeatable }
  - Fax number section: { quantifier: required }
  - Email: { quantifier: repeatable, line: field, type: email address }
  - Registrar WHOIS Server: { quantifier: optional-constrained, line: field, type: hostname }
  - Registrar URL: { line: field, type: http url }
  - Admin contact section: { quantifier: optional-repeatable }
  - Technical contact section: { quantifier: optional-repeatable }
  - Additional field: { quantifier: optional-repeatable, line: field, keytype: registrar object additional field key }
Admin contact section:
  - Admin Contact: { line: field, type: postal line }
  - Phone number section: { quantifier: repeatable }
  - Fax number section: { quantifier: required }
  - Email: { line: field, type: email address, quantifier: repeatable }
Technical contact section:
  - Technical Contact: { line: field, type: postal line }
  - Phone number section: { quantifier: repeatable }
  - Fax number section: { quantifier: required }
  - Email: { line: field, type: email address, quantifier: repeatable }
Phone number section:
  - Phone Number: { line: field, type: phone number }
  - Phone Ext: { quantifier: optional-free, line: field, type: token }
Fax number section:
  Fax number section type A: { quantifier: repeatable }
  Fax number section type B: { quantifier: required }
  Fax number section type C: { quantifier: required }
Fax number section type A:
  - Fax Number: { line: field, type: phone number, quantifier: required-strict }
  - Fax Ext: { line: field, type: token, quantifier: optional-free }
Fax number section type B:
  - Fax Number: { line: field, type: void, quantifier: empty-constrained }
  - Fax Ext: { line: field, type: token, quantifier: optional-free }
Fax number section type C:
  - Fax Number: { line: field, type: void, quantifier: omitted-constrained }
Domain name details section:
  - Domain Name: { line: field, type: query domain name }
  - Internationalized Domain Name: { quantifier: optional-free, line: field, type: u-label }
  - Registry Domain ID: { line: field, type: epp repo id }
  - Registrar WHOIS Server: { quantifier: optional-constrained, line: field, type: hostname }
  - Registrar URL: { line: field, type: http url }
  - Updated Date: { quantifier: optional-constrained, line: field, type: time stamp }
  - Creation Date: { line: field, type: time stamp }
  - Registry Expiry Date: { line: field, type: time stamp }
  - Registrar Registration Expiration Date: { quantifier: optional-constrained, line: field, type: time stamp }
  - Registrar: { line: field, type: token }
  - Registrar IANA ID: { line: field, type: positive integer }
  - Domain name details subsection 1: { }
  - URL of the ICANN Whois Inaccuracy Complaint Form: { line: field, type: inaccuracy form url }
Domain name details subsection 1:
  Domain name details subsection 2: { }
  Domain name details subsection 3: { }
Domain name details subsection 2:
  - Domain abuse contact section: { }
  - Domain name details subsection 4: { }
Domain name details subsection 3:
  - Domain name details subsection 4: { }
  - Domain abuse contact section: { }
Domain name details subsection 4:
  - Reseller: { quantifier: optional-constrained, line: field, type: token }
  - Domain Status: { quantifier: repeatable, line: field, type: domain status }
  - Domain registrant contact section: { }
  - Domain admin contact section: { }
  - Domain tech contact section: { }
  - Domain billing contact section: { quantifier: optional-free }
  - Name server section: { }
  - DNSSEC: { line: field, type: dnssec }
  - Additional field: { quantifier: optional-repeatable, line: field, keytype: domain name object additional field key }
Domain registrant contact section:
  - Registry Registrant ID: { quantifier: optional-free, line: field, type: roid or redacted }
  - Registrant Name: { quantifier: optional-free, line: field, type: postal line }
  - Registrant Organization: { quantifier: optional-constrained, line: field, type: postal line }
  - Registrant Street: { quantifier: optional-repeatable, line: field, type: postal line }
  - Registrant City: { quantifier: optional-free, line: field, type: postal line }
  - Registrant State/Province: { quantifier: optional-constrained, line: field, type: postal line }
  - Registrant Postal Code: { quantifier: optional-free, line: field, type: postal code or redacted }
  - Registrant Country: { quantifier: optional-constrained, line: field, type: country code }
  - Registrant Phone: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Registrant Phone Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Registrant Fax: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Registrant Fax Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Registrant Email: { quantifier: optional-constrained, line: field, type: email web or redacted }
Domain admin contact section:
  - Registry Admin ID: { quantifier: optional-free, line: field, type: roid or redacted }
  - Admin Name: { quantifier: optional-free, line: field, type: postal line }
  - Admin Organization: { quantifier: optional-free, line: field, type: postal line }
  - Admin Street: { quantifier: optional-repeatable, line: field, type: postal line }
  - Admin City: { quantifier: optional-free, line: field, type: postal line }
  - Admin State/Province: { quantifier: optional-free, line: field, type: postal line }
  - Admin Postal Code: { quantifier: optional-free, line: field, type: postal code or redacted }
  - Admin Country: { quantifier: optional-free, line: field, type: country code or redacted }
  - Admin Phone: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Admin Phone Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Admin Fax: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Admin Fax Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Admin Email: { quantifier: optional-free, line: field, type: email web or redacted }
Domain tech contact section:
  - Registry Tech ID: { quantifier: optional-free, line: field, type: roid or redacted }
  - Tech Name: { quantifier: optional-free, line: field, type: postal line }
  - Tech Organization: { quantifier: optional-free, line: field, type: postal line }
  - Tech Street: { quantifier: optional-repeatable, line: field, type: postal line }
  - Tech City: { quantifier: optional-free, line: field, type: postal line }
  - Tech State/Province: { quantifier: optional-free, line: field, type: postal line }
  - Tech Postal Code: { quantifier: optional-free, line: field, type: postal code or redacted }
  - Tech Country: { quantifier: optional-free, line: field, type: country code or redacted }
  - Tech Phone: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Tech Phone Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Tech Fax: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Tech Fax Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Tech Email: { quantifier: optional-free, line: field, type: email web or redacted }
Domain billing contact section:
  - Registry Billing ID: { quantifier: optional-free, line: field, type: roid or redacted }
  - Billing Name: { quantifier: optional-free, line: field, type: postal line }
  - Billing Organization: { quantifier: optional-free, line: field, type: postal line }
  - Billing Street: { quantifier: optional-repeatable, line: field, type: postal line }
  - Billing City: { quantifier: optional-free, line: field, type: postal line }
  - Billing State/Province: { quantifier: optional-free, line: field, type: postal line }
  - Billing Postal Code: { quantifier: optional-free, line: field, type: postal code or redacted }
  - Billing Country: { quantifier: optional-free, line: field, type: country code or redacted }
  - Billing Phone: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Billing Phone Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Billing Fax: { quantifier: optional-free, line: field, type: phone number or redacted }
  - Billing Fax Ext: { quantifier: optional-free, line: field, type: token or redacted }
  - Billing Email: { line: field, type: email web or redacted }
Domain abuse contact section:
  - Registrar Abuse Contact Email: { line: field, type: email address }
  - Registrar Abuse Contact Phone: { line: field, type: phone number }
Name server section:
  Name server section type A: { quantifier: repeatable }
  Name server section type B: { quantifier: repeatable }
  Name server section type C: { quantifier: repeatable }
Name server section type A:
  - Name Server: { quantifier: required-strict, line: field, type: hostname }
  - IP address section: { quantifier: repeatable }
Name server section type B:
  - Name Server: { quantifier: empty-constrained, line: field, type: void }
Name server section type C:
  - Name Server: { quantifier: omitted-constrained, line: field, type: void }
IP address section:
  - IP Address: { quantifier: optional-not-empty, line: field, type: ip address }
Multiple name servers section:
  - Multiple name servers line: { line: multiple name servers line }
  - ROID line: { line: roid line }
  - ROID line: { line: roid line, quantifier: repeatable }
Last updated subsection 1:
  Last updated footer: { }
  Last updated subsection 2: { }
Last updated subsection 2:
  - Empty line: { quantifier: repeatable max 2, line: empty line }
  - Last updated footer: { }
Last updated footer:
  - Last update line: { line: last update line }
AWIP footer:
  - AWIP line: { line: awip line }
  - Empty line: { quantifier: repeatable max 3, line: empty line }
Legal disclaimer:
  - Non-empty line: { line: non-empty line }
  - Any line: { quantifier: optional-repeatable, line: any line }
