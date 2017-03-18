#!/usr/bin/env ksh -p
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#

#
# Copyright 2007 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

#
# Copyright (c) 2013 by Delphix. All rights reserved.
#

. $STF_SUITE/tests/functional/cli_user/misc/misc.cfg
. $STF_SUITE/include/libtest.shlib

#
# DESCRIPTION:
#
# zfs promote returns an error when run as a user
#
# STRATEGY:
#
# 1. Verify we don't have permissions to promote a clone
#
#

log_assert "zfs promote returns an error when run as a user"

log_mustnot $ZFS promote $TESTPOOL/$TESTFS/clone

# Now verify that the above command didn't do anything
if datasetexists $TESTPOOL/$TESTFS/clone@snap
then
	log_fail "Clone $TESTPOOl/$TESTFS/clone was actually promoted!"
fi

log_pass "zfs promote returns an error when run as a user"
