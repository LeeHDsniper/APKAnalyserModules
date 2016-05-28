.class Lcom/localytics/android/AmpSessionHandler$11;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 608
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method

.method private convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 798
    .local p1, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 800
    .local v0, "attributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_75

    .line 802
    const/4 v3, 0x0

    .line 803
    .local v3, "index":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 805
    .local v1, "element":Ljava/lang/String;
    if-nez v3, :cond_22

    .line 807
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 846
    :cond_1f
    :goto_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 809
    :cond_22
    const/4 v4, 0x1

    if-ne v4, v3, :cond_2b

    .line 811
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 813
    :cond_2b
    const/4 v4, 0x2

    if-ne v4, v3, :cond_34

    .line 815
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 817
    :cond_34
    const/4 v4, 0x3

    if-ne v4, v3, :cond_3d

    .line 819
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 821
    :cond_3d
    const/4 v4, 0x4

    if-ne v4, v3, :cond_46

    .line 823
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 825
    :cond_46
    const/4 v4, 0x5

    if-ne v4, v3, :cond_4f

    .line 827
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 829
    :cond_4f
    const/4 v4, 0x6

    if-ne v4, v3, :cond_58

    .line 831
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 833
    :cond_58
    const/4 v4, 0x7

    if-ne v4, v3, :cond_61

    .line 835
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 837
    :cond_61
    const/16 v4, 0x8

    if-ne v4, v3, :cond_6b

    .line 839
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 841
    :cond_6b
    const/16 v4, 0x9

    if-ne v4, v3, :cond_1f

    .line 843
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 850
    .end local v1    # "element":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "index":I
    :cond_75
    return-object v0
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 28
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 612
    const/16 v20, 0x0

    aget-object v11, p1, v20

    check-cast v11, Ljava/lang/String;

    .line 613
    .local v11, "event":Ljava/lang/String;
    const/16 v20, 0x1

    aget-object v4, p1, v20

    check-cast v4, Ljava/lang/String;

    .line 614
    .local v4, "attributes":Ljava/lang/String;
    const/16 v20, 0x2

    aget-object v5, p1, v20

    check-cast v5, Ljava/lang/String;

    .line 615
    .local v5, "customDimensions":Ljava/lang/String;
    const/16 v20, 0x3

    aget-object v20, p1, v20

    check-cast v20, Ljava/lang/Long;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 617
    .local v6, "customerValueIncrease":J
    const/4 v15, 0x0

    .line 620
    .local v15, "nativeAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :try_start_1d
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_2e

    .line 622
    new-instance v20, Lorg/json/JSONObject;

    move-object/from16 v0, v20

    invoke-direct {v0, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static/range {v20 .. v20}, Lcom/localytics/android/JsonHelper;->toMap(Lorg/json/JSONObject;)Ljava/util/Map;
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_2d} :catch_4b

    move-result-object v15

    .line 634
    :cond_2e
    const/16 v16, 0x0

    .line 637
    .local v16, "nativeCustomDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_30
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v20

    if-nez v20, :cond_41

    .line 639
    new-instance v20, Lorg/json/JSONArray;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-static/range {v20 .. v20}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_40} :catch_5a

    move-result-object v16

    .line 653
    :cond_41
    if-nez v11, :cond_69

    .line 655
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "event cannot be null"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 625
    .end local v16    # "nativeCustomDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_4b
    move-exception v8

    .line 627
    .local v8, "e":Lorg/json/JSONException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_57

    .line 629
    const-string v20, "Localytics"

    const-string v21, "[JavaScriptClient]: Failed to parse the json object in tagEventNative"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 631
    :cond_57
    const/16 v20, 0x0

    .line 784
    .end local v8    # "e":Lorg/json/JSONException;
    :goto_59
    return-object v20

    .line 642
    .restart local v16    # "nativeCustomDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_5a
    move-exception v8

    .line 644
    .restart local v8    # "e":Lorg/json/JSONException;
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_66

    .line 646
    const-string v20, "Localytics"

    const-string v21, "[JavaScriptClient]: Failed to parse the json object in tagEventNative"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 648
    :cond_66
    const/16 v20, 0x0

    goto :goto_59

    .line 658
    .end local v8    # "e":Lorg/json/JSONException;
    :cond_69
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_77

    .line 660
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "event cannot be empty"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 663
    :cond_77
    if-eqz v4, :cond_113

    .line 669
    invoke-interface {v15}, Ljava/util/Map;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_8a

    .line 671
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_8a

    .line 673
    const-string v20, "Localytics"

    const-string v21, "attributes is empty.  Did the caller make an error?"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    :cond_8a
    invoke-interface {v15}, Ljava/util/Map;->size()I

    move-result v20

    const/16 v21, 0x32

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_c3

    .line 679
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_c3

    .line 681
    const-string v20, "Localytics"

    const-string v21, "attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface {v15}, Ljava/util/Map;->size()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    const/16 v24, 0x32

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    :cond_c3
    invoke-interface {v15}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "i$":Ljava/util/Iterator;
    :cond_cb
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_113

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 687
    .local v10, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 688
    .local v14, "key":Ljava/lang/String;
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 690
    .local v19, "value":Ljava/lang/String;
    if-nez v14, :cond_ed

    .line 692
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "attributes cannot contain null keys"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 694
    :cond_ed
    if-nez v19, :cond_f7

    .line 696
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "attributes cannot contain null values"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 698
    :cond_f7
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_105

    .line 700
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "attributes cannot contain empty keys"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 702
    :cond_105
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_cb

    .line 704
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "attributes cannot contain empty values"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 709
    .end local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v14    # "key":Ljava/lang/String;
    .end local v19    # "value":Ljava/lang/String;
    :cond_113
    if-eqz v16, :cond_189

    .line 715
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->isEmpty()Z

    move-result v20

    if-eqz v20, :cond_126

    .line 717
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_126

    .line 719
    const-string v20, "Localytics"

    const-string v21, "customDimensions is empty.  Did the caller make an error?"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 723
    :cond_126
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v20

    const/16 v21, 0xa

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_15f

    .line 725
    sget-boolean v20, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v20, :cond_15f

    .line 727
    const-string v20, "Localytics"

    const-string v21, "customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    const/16 v24, 0xa

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    :cond_15f
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13    # "i$":Ljava/util/Iterator;
    :cond_163
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_189

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 733
    .local v9, "element":Ljava/lang/String;
    if-nez v9, :cond_179

    .line 735
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "customDimensions cannot contain null elements"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 737
    :cond_179
    check-cast v9, Ljava/lang/String;

    .end local v9    # "element":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_163

    .line 739
    new-instance v20, Ljava/lang/IllegalArgumentException;

    const-string v21, "customDimensions cannot contain empty elements"

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 745
    .end local v13    # "i$":Ljava/util/Iterator;
    :cond_189
    const-string v20, "%s:%s"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    aput-object v11, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 747
    .local v12, "eventString":Ljava/lang/String;
    if-nez v15, :cond_1e6

    if-nez v16, :cond_1e6

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v21, v0

    const/16 v22, 0x3

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v12, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput-object v25, v23, v24

    const/16 v24, 0x2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-virtual/range {v21 .. v23}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 784
    :goto_1e2
    const/16 v20, 0x0

    goto/16 :goto_59

    .line 757
    :cond_1e6
    new-instance v18, Ljava/util/TreeMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/TreeMap;-><init>()V

    .line 759
    .local v18, "remappedAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v4, :cond_23b

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v17

    .line 762
    .local v17, "packageName":Ljava/lang/String;
    invoke-interface {v15}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .restart local v13    # "i$":Ljava/util/Iterator;
    :goto_205
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_23b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 764
    .restart local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v20, "%s:%s"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v17, v21, v22

    const/16 v22, 0x1

    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_205

    .line 768
    .end local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v13    # "i$":Ljava/util/Iterator;
    .end local v17    # "packageName":Ljava/lang/String;
    :cond_23b
    if-eqz v5, :cond_24c

    .line 770
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/localytics/android/AmpSessionHandler$11;->convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 781
    :cond_24c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler$11;->this$0:Lcom/localytics/android/AmpSessionHandler;

    move-object/from16 v21, v0

    const/16 v22, 0x3

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v12, v23, v24

    const/16 v24, 0x1

    aput-object v18, v23, v24

    const/16 v24, 0x2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-virtual/range {v21 .. v23}, Lcom/localytics/android/AmpSessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Lcom/localytics/android/AmpSessionHandler;->sendMessage(Landroid/os/Message;)Z

    goto/16 :goto_1e2
.end method
