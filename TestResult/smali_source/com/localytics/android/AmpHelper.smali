.class final Lcom/localytics/android/AmpHelper;
.super Ljava/lang/Object;
.source "AmpHelper.java"


# direct methods
.method public static destroyLocalAmp(Lcom/localytics/android/LocalyticsProvider;Ljava/util/Map;Z)V
    .registers 21
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p2, "displayed"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/LocalyticsProvider;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_0
    const-string v12, "campaign_id"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 52
    .local v4, "campaignId":I
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/localytics/android/AmpHelper;->getRuleIdFromCampaignId(Lcom/localytics/android/LocalyticsProvider;I)I

    move-result v10

    .line 54
    .local v10, "ruleId":I
    new-instance v12, Lcom/localytics/android/AmpHelper$1;

    move/from16 v0, p2

    move-object/from16 v1, p0

    invoke-direct {v12, v0, v4, v1, v10}, Lcom/localytics/android/AmpHelper$1;-><init>(ZILcom/localytics/android/LocalyticsProvider;I)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    .line 84
    const-string v12, "base_path"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 85
    .local v3, "basepath":Ljava/lang/String;
    if-eqz v3, :cond_b1

    .line 87
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 88
    .local v6, "dir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v12

    if-eqz v12, :cond_4e

    .line 90
    invoke-virtual {v6}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_3f
    if-ge v8, v9, :cond_4e

    aget-object v5, v2, v8

    .line 92
    .local v5, "childen":Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v6, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 90
    add-int/lit8 v8, v8, 0x1

    goto :goto_3f

    .line 96
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v5    # "childen":Ljava/lang/String;
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    :cond_4e
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    move-result v12

    if-nez v12, :cond_69

    .line 98
    sget-boolean v12, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v12, :cond_69

    .line 100
    const-string v12, "Localytics"

    const-string v13, "Delete %s failed."

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object v3, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    :cond_69
    new-instance v11, Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ".zip"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v11, "zip":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v12

    if-nez v12, :cond_b1

    .line 107
    sget-boolean v12, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v12, :cond_b1

    .line 109
    const-string v12, "Localytics"

    const-string v13, "Delete %s failed."

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ".zip"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_b1} :catch_b2

    .line 126
    .end local v3    # "basepath":Ljava/lang/String;
    .end local v4    # "campaignId":I
    .end local v6    # "dir":Ljava/io/File;
    .end local v10    # "ruleId":I
    .end local v11    # "zip":Ljava/io/File;
    :cond_b1
    :goto_b1
    return-void

    .line 114
    :catch_b2
    move-exception v7

    .line 116
    .local v7, "e":Ljava/lang/Exception;
    sget-boolean v12, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v12, :cond_b1

    .line 118
    const-string v12, "Localytics"

    const-string v13, "Localytics library threw an uncaught exception"

    invoke-static {v12, v13, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b1
.end method

.method public static getConditionIdFromRuleId(Lcom/localytics/android/LocalyticsProvider;J)[J
    .registers 14
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "ruleId"    # J

    .prologue
    .line 136
    const/4 v6, 0x0

    .line 138
    .local v6, "conditionIds":[J
    const/4 v7, 0x0

    .line 141
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "amp_conditions"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "rule_id_ref"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 142
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v6, v0, [J

    .line 144
    const/4 v8, 0x0

    .local v8, "i":I
    move v9, v8

    .line 145
    .end local v8    # "i":I
    .local v9, "i":I
    :goto_32
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_49

    .line 147
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "i":I
    .restart local v8    # "i":I
    const-string v0, "_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    aput-wide v0, v6, v9
    :try_end_47
    .catchall {:try_start_2 .. :try_end_47} :catchall_50

    move v9, v8

    .end local v8    # "i":I
    .restart local v9    # "i":I
    goto :goto_32

    .line 152
    :cond_49
    if-eqz v7, :cond_4f

    .line 154
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 155
    const/4 v7, 0x0

    .line 158
    :cond_4f
    return-object v6

    .line 152
    .end local v9    # "i":I
    :catchall_50
    move-exception v0

    if-eqz v7, :cond_57

    .line 154
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 155
    const/4 v7, 0x0

    :cond_57
    throw v0
.end method

.method public static getRuleIdFromCampaignId(Lcom/localytics/android/LocalyticsProvider;I)I
    .registers 10
    .param p0, "provider"    # Lcom/localytics/android/LocalyticsProvider;
    .param p1, "campaignId"    # I

    .prologue
    .line 26
    const/4 v7, 0x0

    .line 27
    .local v7, "ruleId":I
    const/4 v6, 0x0

    .line 30
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    const-string v1, "amp_rules"

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const-string v0, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "campaign_id"

    aput-object v5, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 31
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 33
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_39
    .catchall {:try_start_2 .. :try_end_39} :catchall_41

    move-result v7

    .line 38
    :cond_3a
    if-eqz v6, :cond_40

    .line 40
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 41
    const/4 v6, 0x0

    .line 44
    :cond_40
    return v7

    .line 38
    :catchall_41
    move-exception v0

    if-eqz v6, :cond_48

    .line 40
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 41
    const/4 v6, 0x0

    :cond_48
    throw v0
.end method
