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
# Copyright (c) 2012 by Delphix. All rights reserved.
#

. $STF_SUITE/include/libtest.shlib
. $STF_SUITE/tests/functional/cli_root/zfs_rename/zfs_rename.kshlib

DISK=${DISKS%% *}

default_setup_noexit "$DISK" "true" "true"

if [[ -d $TESTDIR2 ]]; then
	$RM -rf $TESTDIR2
	if (( $? != 0 )); then
		log_unresolved Could not remove $TESTDIR2
	fi
fi
log_must $ZFS create $TESTPOOL/$DATAFS
log_must zfs_set_mountpoint $TESTDIR2 $TESTPOOL/$DATAFS
#log_must $ZFS set mountpoint=$TESTDIR2 $TESTPOOL/$DATAFS
log_must eval "$DD if=$IF of=$OF bs=$BS count=$CNT >/dev/null 2>&1"

log_pass
