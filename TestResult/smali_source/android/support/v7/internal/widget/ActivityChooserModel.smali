.class public Landroid/support/v7/internal/widget/ActivityChooserModel;
.super Landroid/database/DataSetObservable;
.source "ActivityChooserModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/widget/ActivityChooserModel$1;,
        Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;,
        Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;,
        Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;,
        Landroid/support/v7/internal/widget/ActivityChooserModel$OnChooseActivityListener;,
        Landroid/support/v7/internal/widget/ActivityChooserModel$ActivitySorter;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String;

.field private static final sDataModelRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/support/v7/internal/widget/ActivityChooserModel;",
            ">;"
        }
    .end annotation
.end field

.field private static final sRegistryLock:Ljava/lang/Object;


# instance fields
.field private final mActivities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mActivityChoserModelPolicy:Landroid/support/v7/internal/widget/ActivityChooserModel$OnChooseActivityListener;

.field private mActivitySorter:Landroid/support/v7/internal/widget/ActivityChooserModel$ActivitySorter;

.field private mCanReadHistoricalData:Z

.field private final mContext:Landroid/content/Context;

.field private final mHistoricalRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mHistoricalRecordsChanged:Z

.field private final mHistoryFileName:Ljava/lang/String;

.field private mHistoryMaxSize:I

.field private final mInstanceLock:Ljava/lang/Object;

.field private mIntent:Landroid/content/Intent;

.field private mReadShareHistoryCalled:Z

.field private mReloadActivities:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 161
    const-class v0, Landroid/support/v7/internal/widget/ActivityChooserModel;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    .line 222
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->sRegistryLock:Ljava/lang/Object;

    .line 227
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->sDataModelRegistry:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/internal/widget/ActivityChooserModel;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ActivityChooserModel;

    .prologue
    .line 94
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .registers 1

    .prologue
    .line 94
    sget-object v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v7/internal/widget/ActivityChooserModel;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ActivityChooserModel;

    .prologue
    .line 94
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/v7/internal/widget/ActivityChooserModel;Z)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/ActivityChooserModel;
    .param p1, "x1"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    return p1
.end method

.method private addHisoricalRecord(Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;)Z
    .registers 4
    .param p1, "historicalRecord"    # Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    .prologue
    .line 731
    iget-object v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    .line 732
    .local v0, "added":Z
    if-eqz v0, :cond_17

    .line 733
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    .line 734
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->pruneExcessiveHistoricalRecordsIfNeeded()V

    .line 735
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->persistHistoricalDataIfNeeded()V

    .line 736
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    .line 737
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->notifyChanged()V

    .line 739
    :cond_17
    return v0
.end method

.method private ensureConsistentState()V
    .registers 3

    .prologue
    .line 658
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->loadActivitiesIfNeeded()Z

    move-result v0

    .line 659
    .local v0, "stateChanged":Z
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->readHistoricalDataIfNeeded()Z

    move-result v1

    or-int/2addr v0, v1

    .line 660
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->pruneExcessiveHistoricalRecordsIfNeeded()V

    .line 661
    if-eqz v0, :cond_14

    .line 662
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    .line 663
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->notifyChanged()V

    .line 665
    :cond_14
    return-void
.end method

.method private loadActivitiesIfNeeded()Z
    .registers 8

    .prologue
    const/4 v4, 0x0

    .line 691
    iget-boolean v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mReloadActivities:Z

    if-eqz v5, :cond_37

    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-eqz v5, :cond_37

    .line 692
    iput-boolean v4, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mReloadActivities:Z

    .line 693
    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 694
    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    invoke-virtual {v5, v6, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v3

    .line 696
    .local v3, "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 697
    .local v2, "resolveInfoCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    if-ge v0, v2, :cond_36

    .line 698
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 699
    .local v1, "resolveInfo":Landroid/content/pm/ResolveInfo;
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    new-instance v5, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    invoke-direct {v5, p0, v1}, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;-><init>(Landroid/support/v7/internal/widget/ActivityChooserModel;Landroid/content/pm/ResolveInfo;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 697
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 701
    .end local v1    # "resolveInfo":Landroid/content/pm/ResolveInfo;
    :cond_36
    const/4 v4, 0x1

    .line 703
    .end local v0    # "i":I
    .end local v2    # "resolveInfoCount":I
    .end local v3    # "resolveInfos":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_37
    return v4
.end method

.method private persistHistoricalDataIfNeeded()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 570
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mReadShareHistoryCalled:Z

    if-nez v0, :cond_d

    .line 571
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No preceding call to #readHistoricalData"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_d
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    if-nez v0, :cond_12

    .line 581
    :cond_11
    :goto_11
    return-void

    .line 576
    :cond_12
    iput-boolean v3, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    .line 577
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_11

    .line 578
    new-instance v0, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v7/internal/widget/ActivityChooserModel$PersistHistoryAsyncTask;-><init>(Landroid/support/v7/internal/widget/ActivityChooserModel;Landroid/support/v7/internal/widget/ActivityChooserModel$1;)V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    aput-object v2, v1, v3

    const/4 v2, 0x1

    iget-object v3, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Landroid/support/v4/os/AsyncTaskCompat;->executeParallel(Landroid/os/AsyncTask;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_11
.end method

.method private pruneExcessiveHistoricalRecordsIfNeeded()V
    .registers 5

    .prologue
    .line 746
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryMaxSize:I

    sub-int v1, v2, v3

    .line 747
    .local v1, "pruneCount":I
    if-gtz v1, :cond_d

    .line 757
    :cond_c
    return-void

    .line 750
    :cond_d
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    .line 751
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    if-ge v0, v1, :cond_c

    .line 752
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    .line 751
    add-int/lit8 v0, v0, 0x1

    goto :goto_11
.end method

.method private readHistoricalDataIfNeeded()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 714
    iget-boolean v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v2, :cond_1a

    iget-boolean v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    if-eqz v2, :cond_1a

    iget-object v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1a

    .line 716
    iput-boolean v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    .line 717
    iput-boolean v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mReadShareHistoryCalled:Z

    .line 718
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->readHistoricalDataImpl()V

    .line 721
    :goto_19
    return v0

    :cond_1a
    move v0, v1

    goto :goto_19
.end method

.method private readHistoricalDataImpl()V
    .registers 19

    .prologue
    .line 964
    const/4 v3, 0x0

    .line 966
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;
    :try_end_e
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_e} :catch_23

    move-result-object v3

    .line 974
    :try_start_f
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v8

    .line 975
    .local v8, "parser":Lorg/xmlpull/v1/XmlPullParser;
    const/4 v15, 0x0

    invoke-interface {v8, v3, v15}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 977
    const/4 v12, 0x0

    .line 978
    .local v12, "type":I
    :goto_18
    const/4 v15, 0x1

    if-eq v12, v15, :cond_25

    const/4 v15, 0x2

    if-eq v12, v15, :cond_25

    .line 979
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v12

    goto :goto_18

    .line 967
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "type":I
    :catch_23
    move-exception v4

    .line 1032
    :cond_24
    :goto_24
    return-void

    .line 982
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v12    # "type":I
    :cond_25
    const-string v15, "historical-records"

    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_62

    .line 983
    new-instance v15, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v16, "Share records file does not start with historical-records tag."

    invoke-direct/range {v15 .. v16}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_39
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_f .. :try_end_39} :catch_39
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_39} :catch_92
    .catchall {:try_start_f .. :try_end_39} :catchall_e9

    .line 1019
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "type":I
    :catch_39
    move-exception v14

    .line 1020
    .local v14, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_3a
    sget-object v15, Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Error reading historical recrod file: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v15, v0, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5a
    .catchall {:try_start_3a .. :try_end_5a} :catchall_e9

    .line 1024
    if-eqz v3, :cond_24

    .line 1026
    :try_start_5c
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_60

    goto :goto_24

    .line 1027
    :catch_60
    move-exception v15

    goto :goto_24

    .line 987
    .end local v14    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v12    # "type":I
    :cond_62
    :try_start_62
    move-object/from16 v0, p0

    iget-object v5, v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    .line 988
    .local v5, "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 991
    :cond_69
    :goto_69
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->next()I
    :try_end_6c
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_62 .. :try_end_6c} :catch_39
    .catch Ljava/io/IOException; {:try_start_62 .. :try_end_6c} :catch_92
    .catchall {:try_start_62 .. :try_end_6c} :catchall_e9

    move-result v12

    .line 992
    const/4 v15, 0x1

    if-ne v12, v15, :cond_78

    .line 1024
    if-eqz v3, :cond_24

    .line 1026
    :try_start_72
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_75
    .catch Ljava/io/IOException; {:try_start_72 .. :try_end_75} :catch_76

    goto :goto_24

    .line 1027
    :catch_76
    move-exception v15

    goto :goto_24

    .line 995
    :cond_78
    const/4 v15, 0x3

    if-eq v12, v15, :cond_69

    const/4 v15, 0x4

    if-eq v12, v15, :cond_69

    .line 998
    :try_start_7e
    invoke-interface {v8}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 999
    .local v7, "nodeName":Ljava/lang/String;
    const-string v15, "historical-record"

    invoke-virtual {v15, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_bd

    .line 1000
    new-instance v15, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v16, "Share records file not well-formed."

    invoke-direct/range {v15 .. v16}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_92
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7e .. :try_end_92} :catch_39
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_92} :catch_92
    .catchall {:try_start_7e .. :try_end_92} :catchall_e9

    .line 1021
    .end local v5    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v7    # "nodeName":Ljava/lang/String;
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v12    # "type":I
    :catch_92
    move-exception v6

    .line 1022
    .local v6, "ioe":Ljava/io/IOException;
    :try_start_93
    sget-object v15, Landroid/support/v7/internal/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Error reading historical recrod file: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v15, v0, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b3
    .catchall {:try_start_93 .. :try_end_b3} :catchall_e9

    .line 1024
    if-eqz v3, :cond_24

    .line 1026
    :try_start_b5
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_b8
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_b8} :catch_ba

    goto/16 :goto_24

    .line 1027
    :catch_ba
    move-exception v15

    goto/16 :goto_24

    .line 1003
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v5    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    .restart local v7    # "nodeName":Ljava/lang/String;
    .restart local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .restart local v12    # "type":I
    :cond_bd
    const/4 v15, 0x0

    :try_start_be
    const-string v16, "activity"

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1004
    .local v2, "activity":Ljava/lang/String;
    const/4 v15, 0x0

    const-string v16, "time"

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 1006
    .local v10, "time":J
    const/4 v15, 0x0

    const-string v16, "weight"

    move-object/from16 v0, v16

    invoke-interface {v8, v15, v0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v13

    .line 1008
    .local v13, "weight":F
    new-instance v9, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    invoke-direct {v9, v2, v10, v11, v13}, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;-><init>(Ljava/lang/String;JF)V

    .line 1009
    .local v9, "readRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_e8
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_be .. :try_end_e8} :catch_39
    .catch Ljava/io/IOException; {:try_start_be .. :try_end_e8} :catch_92
    .catchall {:try_start_be .. :try_end_e8} :catchall_e9

    goto :goto_69

    .line 1024
    .end local v2    # "activity":Ljava/lang/String;
    .end local v5    # "historicalRecords":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;>;"
    .end local v7    # "nodeName":Ljava/lang/String;
    .end local v8    # "parser":Lorg/xmlpull/v1/XmlPullParser;
    .end local v9    # "readRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    .end local v10    # "time":J
    .end local v12    # "type":I
    .end local v13    # "weight":F
    :catchall_e9
    move-exception v15

    if-eqz v3, :cond_ef

    .line 1026
    :try_start_ec
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_ef
    .catch Ljava/io/IOException; {:try_start_ec .. :try_end_ef} :catch_f0

    .line 1029
    :cond_ef
    :goto_ef
    throw v15

    .line 1027
    :catch_f0
    move-exception v16

    goto :goto_ef
.end method

.method private sortActivitiesIfNeeded()Z
    .registers 5

    .prologue
    .line 675
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/internal/widget/ActivityChooserModel$ActivitySorter;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    .line 677
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/internal/widget/ActivityChooserModel$ActivitySorter;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivitySorter;->sort(Landroid/content/Intent;Ljava/util/List;Ljava/util/List;)V

    .line 679
    const/4 v0, 0x1

    .line 681
    :goto_28
    return v0

    :cond_29
    const/4 v0, 0x0

    goto :goto_28
.end method


# virtual methods
.method public chooseActivity(I)Landroid/content/Intent;
    .registers 12
    .param p1, "index"    # I

    .prologue
    const/4 v6, 0x0

    .line 461
    iget-object v7, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v7

    .line 462
    :try_start_4
    iget-object v8, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-nez v8, :cond_b

    .line 463
    monitor-exit v7

    move-object v0, v6

    .line 491
    :goto_a
    return-object v0

    .line 466
    :cond_b
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 468
    iget-object v8, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v8, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    .line 470
    .local v2, "chosenActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    new-instance v3, Landroid/content/ComponentName;

    iget-object v8, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v8, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v9, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v9, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v9, v9, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v3, v8, v9}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    .local v3, "chosenName":Landroid/content/ComponentName;
    new-instance v0, Landroid/content/Intent;

    iget-object v8, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 475
    .local v0, "choiceIntent":Landroid/content/Intent;
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 477
    iget-object v8, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivityChoserModelPolicy:Landroid/support/v7/internal/widget/ActivityChooserModel$OnChooseActivityListener;

    if-eqz v8, :cond_45

    .line 479
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 480
    .local v1, "choiceIntentCopy":Landroid/content/Intent;
    iget-object v8, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivityChoserModelPolicy:Landroid/support/v7/internal/widget/ActivityChooserModel$OnChooseActivityListener;

    invoke-interface {v8, p0, v1}, Landroid/support/v7/internal/widget/ActivityChooserModel$OnChooseActivityListener;->onChooseActivity(Landroid/support/v7/internal/widget/ActivityChooserModel;Landroid/content/Intent;)Z

    move-result v4

    .line 482
    .local v4, "handled":Z
    if-eqz v4, :cond_45

    .line 483
    monitor-exit v7

    move-object v0, v6

    goto :goto_a

    .line 487
    .end local v1    # "choiceIntentCopy":Landroid/content/Intent;
    .end local v4    # "handled":Z
    :cond_45
    new-instance v5, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/high16 v6, 0x3f800000

    invoke-direct {v5, v3, v8, v9, v6}, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;-><init>(Landroid/content/ComponentName;JF)V

    .line 489
    .local v5, "historicalRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    invoke-direct {p0, v5}, Landroid/support/v7/internal/widget/ActivityChooserModel;->addHisoricalRecord(Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;)Z

    .line 491
    monitor-exit v7

    goto :goto_a

    .line 492
    .end local v0    # "choiceIntent":Landroid/content/Intent;
    .end local v2    # "chosenActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    .end local v3    # "chosenName":Landroid/content/ComponentName;
    .end local v5    # "historicalRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    :catchall_55
    move-exception v6

    monitor-exit v7
    :try_end_57
    .catchall {:try_start_4 .. :try_end_57} :catchall_55

    throw v6
.end method

.method public getActivity(I)Landroid/content/pm/ResolveInfo;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 414
    iget-object v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 415
    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 416
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    monitor-exit v1

    return-object v0

    .line 417
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw v0
.end method

.method public getActivityCount()I
    .registers 3

    .prologue
    .line 399
    iget-object v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 400
    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 401
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 402
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public getActivityIndex(Landroid/content/pm/ResolveInfo;)I
    .registers 8
    .param p1, "activity"    # Landroid/content/pm/ResolveInfo;

    .prologue
    .line 428
    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v5

    .line 429
    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 430
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    .line 431
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    .line 432
    .local v1, "activityCount":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_d
    if-ge v3, v1, :cond_1e

    .line 433
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    .line 434
    .local v2, "currentActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    iget-object v4, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    if-ne v4, p1, :cond_1b

    .line 435
    monitor-exit v5

    .line 438
    .end local v2    # "currentActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    .end local v3    # "i":I
    :goto_1a
    return v3

    .line 432
    .restart local v2    # "currentActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    .restart local v3    # "i":I
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 438
    .end local v2    # "currentActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    :cond_1e
    const/4 v3, -0x1

    monitor-exit v5

    goto :goto_1a

    .line 439
    .end local v0    # "activities":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;>;"
    .end local v1    # "activityCount":I
    .end local v3    # "i":I
    :catchall_21
    move-exception v4

    monitor-exit v5
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw v4
.end method

.method public getDefaultActivity()Landroid/content/pm/ResolveInfo;
    .registers 4

    .prologue
    .line 516
    iget-object v1, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 517
    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 518
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 519
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    monitor-exit v1

    .line 522
    :goto_1a
    return-object v0

    .line 521
    :cond_1b
    monitor-exit v1

    .line 522
    const/4 v0, 0x0

    goto :goto_1a

    .line 521
    :catchall_1e
    move-exception v0

    monitor-exit v1
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v0
.end method

.method public setDefaultActivity(I)V
    .registers 12
    .param p1, "index"    # I

    .prologue
    .line 536
    iget-object v6, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v6

    .line 537
    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActivityChooserModel;->ensureConsistentState()V

    .line 539
    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    .line 540
    .local v2, "newDefaultActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    iget-object v5, p0, Landroid/support/v7/internal/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    const/4 v7, 0x0

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;

    .line 543
    .local v3, "oldDefaultActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    if-eqz v3, :cond_41

    .line 545
    iget v5, v3, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->weight:F

    iget v7, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->weight:F

    sub-float/2addr v5, v7

    const/high16 v7, 0x40a00000

    add-float v4, v5, v7

    .line 551
    .local v4, "weight":F
    :goto_22
    new-instance v0, Landroid/content/ComponentName;

    iget-object v5, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v7, v2, Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v7, v7, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v7, v7, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v5, v7}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    .local v0, "defaultName":Landroid/content/ComponentName;
    new-instance v1, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v1, v0, v8, v9, v4}, Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;-><init>(Landroid/content/ComponentName;JF)V

    .line 556
    .local v1, "historicalRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    invoke-direct {p0, v1}, Landroid/support/v7/internal/widget/ActivityChooserModel;->addHisoricalRecord(Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;)Z

    .line 557
    monitor-exit v6

    .line 558
    return-void

    .line 548
    .end local v0    # "defaultName":Landroid/content/ComponentName;
    .end local v1    # "historicalRecord":Landroid/support/v7/internal/widget/ActivityChooserModel$HistoricalRecord;
    .end local v4    # "weight":F
    :cond_41
    const/high16 v4, 0x3f800000

    .restart local v4    # "weight":F
    goto :goto_22

    .line 557
    .end local v2    # "newDefaultActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    .end local v3    # "oldDefaultActivity":Landroid/support/v7/internal/widget/ActivityChooserModel$ActivityResolveInfo;
    .end local v4    # "weight":F
    :catchall_44
    move-exception v5

    monitor-exit v6
    :try_end_46
    .catchall {:try_start_3 .. :try_end_46} :catchall_44

    throw v5
.end method
