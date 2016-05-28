.class final Lcom/localytics/android/AmpHelper$1;
.super Ljava/lang/Object;
.source "AmpHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpHelper;->destroyLocalAmp(Lcom/localytics/android/LocalyticsProvider;Ljava/util/Map;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$campaignId:I

.field final synthetic val$displayed:Z

.field final synthetic val$provider:Lcom/localytics/android/LocalyticsProvider;

.field final synthetic val$ruleId:I


# direct methods
.method constructor <init>(ZILcom/localytics/android/LocalyticsProvider;I)V
    .registers 5

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/localytics/android/AmpHelper$1;->val$displayed:Z

    iput p2, p0, Lcom/localytics/android/AmpHelper$1;->val$campaignId:I

    iput-object p3, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    iput p4, p0, Lcom/localytics/android/AmpHelper$1;->val$ruleId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 59
    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    .line 60
    .local v6, "values":Landroid/content/ContentValues;
    const-string v10, "displayed"

    iget-boolean v7, p0, Lcom/localytics/android/AmpHelper$1;->val$displayed:Z

    if-eqz v7, :cond_55

    move v7, v8

    :goto_e
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v10, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 61
    const-string v7, "campaign_id"

    iget v10, p0, Lcom/localytics/android/AmpHelper$1;->val$campaignId:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v7, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 62
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v10, "amp_displayed"

    invoke-virtual {v7, v10, v6}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 68
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    iget v10, p0, Lcom/localytics/android/AmpHelper$1;->val$ruleId:I

    int-to-long v10, v10

    invoke-static {v7, v10, v11}, Lcom/localytics/android/AmpHelper;->getConditionIdFromRuleId(Lcom/localytics/android/LocalyticsProvider;J)[J

    move-result-object v1

    .line 69
    .local v1, "conditionIds":[J
    move-object v0, v1

    .local v0, "arr$":[J
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_33
    if-ge v4, v5, :cond_57

    aget-wide v2, v0, v4

    .line 71
    .local v2, "conditionId":J
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v10, "amp_condition_values"

    const-string v11, "%s = ?"

    new-array v12, v8, [Ljava/lang/Object;

    const-string v13, "condition_id_ref"

    aput-object v13, v12, v9

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-array v12, v8, [Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v7, v10, v11, v12}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 69
    add-int/lit8 v4, v4, 0x1

    goto :goto_33

    .end local v0    # "arr$":[J
    .end local v1    # "conditionIds":[J
    .end local v2    # "conditionId":J
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_55
    move v7, v9

    .line 60
    goto :goto_e

    .line 73
    .restart local v0    # "arr$":[J
    .restart local v1    # "conditionIds":[J
    .restart local v4    # "i$":I
    .restart local v5    # "len$":I
    :cond_57
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v10, "amp_conditions"

    const-string v11, "%s = ?"

    new-array v12, v8, [Ljava/lang/Object;

    const-string v13, "rule_id_ref"

    aput-object v13, v12, v9

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-array v12, v8, [Ljava/lang/String;

    iget v13, p0, Lcom/localytics/android/AmpHelper$1;->val$ruleId:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v7, v10, v11, v12}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 76
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v10, "amp_ruleevent"

    const-string v11, "%s = ?"

    new-array v12, v8, [Ljava/lang/Object;

    const-string v13, "rule_id_ref"

    aput-object v13, v12, v9

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-array v12, v8, [Ljava/lang/String;

    iget v13, p0, Lcom/localytics/android/AmpHelper$1;->val$ruleId:I

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v9

    invoke-virtual {v7, v10, v11, v12}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 79
    iget-object v7, p0, Lcom/localytics/android/AmpHelper$1;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v10, "amp_rules"

    const-string v11, "%s = ?"

    new-array v12, v8, [Ljava/lang/Object;

    const-string v13, "_id"

    aput-object v13, v12, v9

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    new-array v8, v8, [Ljava/lang/String;

    iget v12, p0, Lcom/localytics/android/AmpHelper$1;->val$ruleId:I

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v8, v9

    invoke-virtual {v7, v10, v11, v8}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 80
    return-void
.end method
