.class Lcom/localytics/android/AmpRulesAdapter;
.super Landroid/widget/BaseAdapter;
.source "AmpRulesAdapter.java"


# instance fields
.field private mAmpRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    .line 37
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lcom/localytics/android/AmpRulesAdapter;->getItem(I)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getItem(I)Ljava/util/Map;
    .registers 3
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    return-object v0
.end method

.method public getItemId(I)J
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 108
    iget-object v1, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v2, "campaign_id"

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 109
    .local v0, "id":I
    int-to-long v2, v0

    return-wide v2
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v11, 0x0

    const/4 v10, -0x1

    const/4 v7, -0x2

    const/high16 v9, -0x1000000

    const/4 v8, 0x1

    .line 115
    move-object v5, p2

    .line 117
    .local v5, "view":Landroid/view/View;
    if-nez v5, :cond_7b

    .line 120
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v2, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 121
    .local v2, "rootLayout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/AbsListView$LayoutParams;

    invoke-direct {v6, v10, v7}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 125
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 126
    .local v0, "layout":Landroid/widget/LinearLayout;
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v10, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    const/16 v6, 0x10

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 128
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 129
    iget-object v6, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x41000000

    mul-float/2addr v6, v7

    const/high16 v7, 0x3f000000

    add-float/2addr v6, v7

    float-to-int v1, v6

    .line 130
    .local v1, "padding":I
    shl-int/lit8 v6, v1, 0x1

    shl-int/lit8 v7, v1, 0x1

    invoke-virtual {v0, v6, v1, v7, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 131
    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 134
    new-instance v3, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 135
    .local v3, "ruleId":Landroid/widget/TextView;
    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setId(I)V

    .line 136
    const/high16 v6, 0x41800000

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 137
    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 138
    new-instance v4, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/localytics/android/AmpRulesAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v4, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 139
    .local v4, "ruleName":Landroid/widget/TextView;
    const/4 v6, 0x2

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setId(I)V

    .line 140
    const/high16 v6, 0x41c00000

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 141
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 145
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 148
    move-object v5, v2

    .line 152
    .end local v0    # "layout":Landroid/widget/LinearLayout;
    .end local v1    # "padding":I
    .end local v2    # "rootLayout":Landroid/widget/LinearLayout;
    .end local v3    # "ruleId":Landroid/widget/TextView;
    .end local v4    # "ruleName":Landroid/widget/TextView;
    :cond_7b
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 153
    .restart local v3    # "ruleId":Landroid/widget/TextView;
    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 155
    .restart local v4    # "ruleName":Landroid/widget/TextView;
    const-string v6, "Campaign ID: %d"

    new-array v7, v8, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/localytics/android/AmpRulesAdapter;->getItemId(I)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v11

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    invoke-virtual {p0, p1}, Lcom/localytics/android/AmpRulesAdapter;->getItem(I)Ljava/util/Map;

    move-result-object v6

    const-string v7, "rule_name"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    return-object v5
.end method

.method public updateDataSet(Lcom/localytics/android/LocalyticsProvider;)Z
    .registers 12
    .param p1, "provider"    # Lcom/localytics/android/LocalyticsProvider;

    .prologue
    .line 41
    const/4 v9, 0x0

    .line 43
    .local v9, "updated":Z
    iget-object v0, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 46
    const/4 v7, 0x0

    .line 49
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_7
    const-string v1, "amp_rules"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "campaign_id"

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 50
    :goto_13
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_16a

    .line 52
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 54
    .local v6, "ampRule":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "_id"

    const-string v1, "_id"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v0, "campaign_id"

    const-string v1, "campaign_id"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v0, "expiration"

    const-string v1, "expiration"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v0, "display_seconds"

    const-string v1, "display_seconds"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v0, "display_session"

    const-string v1, "display_session"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v0, "version"

    const-string v1, "version"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v0, "phone_location"

    const-string v1, "phone_location"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v0, "phone_size_width"

    const-string v1, "phone_size_width"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v0, "phone_size_height"

    const-string v1, "phone_size_height"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v0, "tablet_location"

    const-string v1, "tablet_location"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v0, "tablet_size_width"

    const-string v1, "tablet_size_width"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v0, "tablet_size_height"

    const-string v1, "tablet_size_height"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v0, "time_to_display"

    const-string v1, "time_to_display"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v0, "internet_required"

    const-string v1, "internet_required"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string v0, "ab_test"

    const-string v1, "ab_test"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v0, "rule_name"

    const-string v1, "rule_name"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v0, "location"

    const-string v1, "location"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v0, "devices"

    const-string v1, "devices"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    iget-object v0, p0, Lcom/localytics/android/AmpRulesAdapter;->mAmpRules:Ljava/util/List;

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_15d
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_15d} :catch_15f
    .catchall {:try_start_7 .. :try_end_15d} :catchall_172

    goto/16 :goto_13

    .line 77
    .end local v6    # "ampRule":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :catch_15f
    move-exception v8

    .line 79
    .local v8, "e":Ljava/lang/Exception;
    :try_start_160
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_163
    .catchall {:try_start_160 .. :try_end_163} :catchall_172

    .line 83
    if-eqz v7, :cond_169

    .line 85
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 86
    const/4 v7, 0x0

    .line 90
    .end local v8    # "e":Ljava/lang/Exception;
    :cond_169
    :goto_169
    return v9

    .line 75
    :cond_16a
    const/4 v9, 0x1

    .line 83
    if-eqz v7, :cond_169

    .line 85
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 86
    const/4 v7, 0x0

    goto :goto_169

    .line 83
    :catchall_172
    move-exception v0

    if-eqz v7, :cond_179

    .line 85
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 86
    const/4 v7, 0x0

    :cond_179
    throw v0
.end method
