.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;
.super Landroid/content/ContentProvider;
.source "CdsProvider.java"


# static fields
.field private static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private static mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

.field private static mUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-string v0, "AdobeImageCdsProvider"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method

.method private setupUriMatcher(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 531
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 533
    .local v0, "authority":Ljava/lang/String;
    new-instance v1, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v1, v2}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    .line 558
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/identifier/*"

    const/4 v3, 0x6

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 562
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#"

    const/4 v3, 0x5

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 566
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/list"

    const/4 v3, 0x7

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 570
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/update"

    const/16 v3, 0xcc

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 574
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/remove"

    const/16 v3, 0x12f

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 582
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/content/list"

    const/16 v3, 0x2b

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 586
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/content/id/#/update"

    const/16 v3, 0xcb

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 590
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/content/id/#/updatePurchasedStatus/#"

    const/16 v3, 0xcf

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 594
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/requestDownload/#"

    const/16 v3, 0xd0

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 598
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/id/#/content"

    const/16 v3, 0x8

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 602
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/identifier/*/content"

    const/16 v3, 0x9

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 607
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/type/*/content/available/list"

    const/16 v3, 0xb

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 612
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/type/*/content/hidden/list"

    const/16 v3, 0x13

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 615
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/type/*/content/availableAndPurchasable/list"

    const/16 v3, 0x14

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 621
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/type/*/content/restore/list"

    const/16 v3, 0xf

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 625
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/type/*/content/installed/list"

    const/16 v3, 0x11

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 629
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/content/installed/list"

    const/16 v3, 0x12

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 637
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/#/item/list"

    const/16 v3, 0xa

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 638
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/content/item/#"

    const/16 v3, 0xc

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 639
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/*/item/*"

    const/16 v3, 0x15

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 647
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "bulk/insertPackContentAndItems"

    const/16 v3, 0x191

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 652
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "bulk/insertMessageAndContent"

    const/16 v3, 0x192

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 660
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "packTray/#/#/#/#/#/*"

    const/16 v3, 0x36

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 664
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "storeFeatured/#/#"

    const/16 v3, 0x38

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 668
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "storeFeatured/banners/#"

    const/16 v3, 0x39

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 676
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "manifestVersion"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 679
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "manifestVersion/insert"

    const/16 v3, 0x65

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 687
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "permissions/list"

    const/16 v3, 0x37

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 690
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "permissions/replace"

    const/16 v3, 0x68

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 698
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/list"

    const/4 v3, 0x2

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 701
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/active/*"

    const/16 v3, 0xd

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 704
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/next/*"

    const/16 v3, 0xe

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 707
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/future/*"

    const/16 v3, 0x16

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 711
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/identifier/*"

    const/4 v3, 0x3

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 715
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/id/#/content"

    const/4 v3, 0x4

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 719
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/id/#/remove"

    const/16 v3, 0x12d

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 723
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/id/#/update"

    const/16 v3, 0xc9

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 727
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/id/#/content/id/#/update"

    const/16 v3, 0xca

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 729
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "message/content/id/#/markasread/#"

    const/16 v3, 0xd1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 737
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "packDownloadStatus/#"

    const/16 v3, 0x2f

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 741
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "insertPacksDownloadTable"

    const/16 v3, 0x67

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 745
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "downloadPackId/#"

    const/16 v3, 0x30

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 749
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "download/id/#/updateStatus/#"

    const/16 v3, 0xce

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 752
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    const-string v2, "pack/#/delete_download_entry"

    const/16 v3, 0x12e

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 754
    return-void
.end method


# virtual methods
.method public applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/content/ContentProviderOperation;",
            ">;)[",
            "Landroid/content/ContentProviderResult;"
        }
    .end annotation

    .prologue
    .line 121
    .local p1, "operations":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/ContentProviderOperation;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v5, v6, [Landroid/content/ContentProviderResult;

    .line 122
    .local v5, "result":[Landroid/content/ContentProviderResult;
    const/4 v2, 0x0

    .line 123
    .local v2, "i":I
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 125
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 127
    :try_start_10
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;
    :try_end_13
    .catch Landroid/content/OperationApplicationException; {:try_start_10 .. :try_end_13} :catch_33
    .catchall {:try_start_10 .. :try_end_13} :catchall_49

    move-result-object v6

    move v3, v2

    .end local v2    # "i":I
    .local v3, "i":I
    :goto_15
    :try_start_15
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ContentProviderOperation;
    :try_end_21
    .catch Landroid/content/OperationApplicationException; {:try_start_15 .. :try_end_21} :catch_51
    .catchall {:try_start_15 .. :try_end_21} :catchall_4e

    .line 128
    .local v4, "operation":Landroid/content/ContentProviderOperation;
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    :try_start_23
    invoke-virtual {v4, p0, v5, v2}, Landroid/content/ContentProviderOperation;->apply(Landroid/content/ContentProvider;[Landroid/content/ContentProviderResult;I)Landroid/content/ContentProviderResult;

    move-result-object v7

    aput-object v7, v5, v3
    :try_end_29
    .catch Landroid/content/OperationApplicationException; {:try_start_23 .. :try_end_29} :catch_33
    .catchall {:try_start_23 .. :try_end_29} :catchall_49

    move v3, v2

    .line 129
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_15

    .line 131
    .end local v4    # "operation":Landroid/content/ContentProviderOperation;
    :cond_2b
    :try_start_2b
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2e
    .catch Landroid/content/OperationApplicationException; {:try_start_2b .. :try_end_2e} :catch_51
    .catchall {:try_start_2b .. :try_end_2e} :catchall_4e

    .line 135
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    move v2, v3

    .line 137
    .end local v3    # "i":I
    .restart local v2    # "i":I
    :goto_32
    return-object v5

    .line 132
    :catch_33
    move-exception v1

    .line 133
    .local v1, "e":Landroid/content/OperationApplicationException;
    :goto_34
    :try_start_34
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "batch failed: %s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Landroid/content/OperationApplicationException;->getMessage()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_45
    .catchall {:try_start_34 .. :try_end_45} :catchall_49

    .line 135
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_32

    .end local v1    # "e":Landroid/content/OperationApplicationException;
    :catchall_49
    move-exception v6

    :goto_4a
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v6

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :catchall_4e
    move-exception v6

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_4a

    .line 132
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :catch_51
    move-exception v1

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_34
.end method

.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .registers 19
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # [Landroid/content/ContentValues;

    .prologue
    .line 147
    const/4 v2, 0x0

    .line 148
    .local v2, "count":I
    const/4 v5, 0x1

    .line 150
    .local v5, "success":Z
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-result-object v13

    invoke-virtual {v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 151
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 155
    :try_start_11
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v13

    packed-switch v13, :pswitch_data_ea

    .line 226
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "invalid uri"

    invoke-interface {v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 227
    const/4 v5, 0x0

    .line 232
    :cond_24
    :goto_24
    if-eqz v5, :cond_29

    .line 233
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_29
    .catchall {:try_start_11 .. :try_end_29} :catchall_e2

    .line 237
    :cond_29
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 240
    if-eqz v5, :cond_e7

    move v13, v2

    :goto_2f
    return v13

    .line 161
    :pswitch_30
    :try_start_30
    move-object/from16 v0, p2

    array-length v13, v0

    const/4 v14, 0x3

    if-ge v13, v14, :cond_43

    .line 162
    sget-object v13, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v14, "invalid size"

    invoke-interface {v13, v14}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V
    :try_end_3d
    .catchall {:try_start_30 .. :try_end_3d} :catchall_e2

    .line 163
    const/4 v5, 0x0

    .line 164
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2f

    .line 168
    :cond_43
    const/4 v13, 0x0

    :try_start_44
    aget-object v12, p2, v13

    .line 169
    .local v12, "value":Landroid/content/ContentValues;
    const-string v13, "packs_table"

    invoke-static {v13, v12, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_4b
    .catchall {:try_start_44 .. :try_end_4b} :catchall_e2

    move-result-wide v8

    .line 170
    .local v8, "packId":J
    const-wide/16 v14, 0x0

    cmp-long v13, v8, v14

    if-gez v13, :cond_58

    .line 171
    const/4 v5, 0x0

    .line 172
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2f

    .line 176
    :cond_58
    const/4 v13, 0x1

    :try_start_59
    aget-object v12, p2, v13

    .line 177
    const-string v13, "content_packId"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 178
    const-string v13, "content_table"

    invoke-static {v13, v12, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_69
    .catchall {:try_start_59 .. :try_end_69} :catchall_e2

    move-result-wide v10

    .line 179
    .local v10, "rowId":J
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-gez v13, :cond_76

    .line 180
    const/4 v5, 0x0

    .line 181
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2f

    .line 185
    :cond_76
    const/4 v4, 0x2

    .local v4, "i":I
    :goto_77
    :try_start_77
    move-object/from16 v0, p2

    array-length v13, v0

    if-ge v4, v13, :cond_24

    .line 186
    aget-object v12, p2, v4

    .line 187
    const-string v13, "item_packId"

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 188
    const-string v13, "items_table"

    invoke-static {v13, v12, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_8c
    .catchall {:try_start_77 .. :try_end_8c} :catchall_e2

    move-result-wide v10

    .line 189
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-gez v13, :cond_99

    .line 190
    const/4 v5, 0x0

    .line 191
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2f

    .line 193
    :cond_99
    add-int/lit8 v2, v2, 0x1

    .line 185
    add-int/lit8 v4, v4, 0x1

    goto :goto_77

    .line 200
    .end local v4    # "i":I
    .end local v8    # "packId":J
    .end local v10    # "rowId":J
    .end local v12    # "value":Landroid/content/ContentValues;
    :pswitch_9e
    :try_start_9e
    move-object/from16 v0, p2

    array-length v13, v0
    :try_end_a1
    .catchall {:try_start_9e .. :try_end_a1} :catchall_e2

    const/4 v14, 0x2

    if-eq v13, v14, :cond_aa

    .line 201
    const/4 v5, 0x0

    .line 202
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2f

    .line 206
    :cond_aa
    const/4 v13, 0x0

    :try_start_ab
    aget-object v12, p2, v13

    .line 207
    .restart local v12    # "value":Landroid/content/ContentValues;
    const-string v13, "messages_table"

    invoke-static {v13, v12, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_b2
    .catchall {:try_start_ab .. :try_end_b2} :catchall_e2

    move-result-wide v6

    .line 209
    .local v6, "messageId":J
    const-wide/16 v14, 0x0

    cmp-long v13, v6, v14

    if-gez v13, :cond_c0

    .line 210
    const/4 v5, 0x0

    .line 211
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_2f

    .line 215
    :cond_c0
    const/4 v13, 0x1

    :try_start_c1
    aget-object v12, p2, v13

    .line 216
    const-string v13, "msgcnt_messageId"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 217
    const-string v13, "messages_content_table"

    invoke-static {v13, v12, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;Landroid/database/sqlite/SQLiteDatabase;)J
    :try_end_d1
    .catchall {:try_start_c1 .. :try_end_d1} :catchall_e2

    move-result-wide v10

    .line 218
    .restart local v10    # "rowId":J
    const-wide/16 v14, 0x0

    cmp-long v13, v10, v14

    if-gez v13, :cond_df

    .line 219
    const/4 v5, 0x0

    .line 220
    const/4 v13, 0x0

    .line 237
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto/16 :goto_2f

    .line 222
    :cond_df
    const/4 v2, 0x1

    .line 223
    goto/16 :goto_24

    .line 237
    .end local v6    # "messageId":J
    .end local v10    # "rowId":J
    .end local v12    # "value":Landroid/content/ContentValues;
    :catchall_e2
    move-exception v13

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v13

    .line 240
    :cond_e7
    const/4 v13, 0x0

    goto/16 :goto_2f

    .line 155
    :pswitch_data_ea
    .packed-switch 0x191
        :pswitch_30
        :pswitch_9e
    .end packed-switch
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 9
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 53
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    sparse-switch v2, :sswitch_data_78

    move v2, v3

    .line 76
    :goto_b
    return v2

    .line 56
    :sswitch_c
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 57
    .local v0, "id":J
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->deletePack(J)I

    move-result v2

    goto :goto_b

    .line 60
    .end local v0    # "id":J
    :sswitch_2b
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x2

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 61
    .restart local v0    # "id":J
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->deletePackDownloadEntry(J)I

    move v2, v3

    .line 76
    goto :goto_b

    .line 65
    .end local v0    # "id":J
    :sswitch_4a
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 66
    .restart local v0    # "id":J
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->deleteMessage(J)I

    move-result v2

    goto :goto_b

    .line 69
    .end local v0    # "id":J
    :sswitch_69
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 70
    .restart local v0    # "id":J
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->deletePackDownloadEntry(J)I

    move-result v2

    goto :goto_b

    .line 53
    :sswitch_data_78
    .sparse-switch
        0x5 -> :sswitch_69
        0x12d -> :sswitch_4a
        0x12e -> :sswitch_2b
        0x12f -> :sswitch_c
    .end sparse-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 81
    const-string v0, "vnd.android.cursor.item"

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .registers 11
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    const-wide/16 v6, -0x1

    const/4 v2, 0x0

    .line 249
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    packed-switch v3, :pswitch_data_a6

    .line 277
    :pswitch_c
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "invalid uri"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 280
    :cond_13
    :goto_13
    return-object v2

    .line 252
    :pswitch_14
    const-string v3, "version_versionKey"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_24

    const-string v3, "version_assetsBaseURL"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 253
    :cond_24
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "missing version or asset url from values!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_13

    .line 256
    :cond_2c
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    const-string v4, "version_table"

    invoke-virtual {v3, v4, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 257
    .local v0, "id":J
    cmp-long v3, v0, v6

    if-lez v3, :cond_13

    .line 258
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "manifestVersion/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_13

    .line 263
    .end local v0    # "id":J
    :pswitch_54
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    const-string v4, "packs_download_table"

    invoke-virtual {v3, v4, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->insertValues(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 264
    .restart local v0    # "id":J
    cmp-long v3, v0, v6

    if-lez v3, :cond_13

    .line 265
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "downloadEntry/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_13

    .line 270
    .end local v0    # "id":J
    :pswitch_7c
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v3, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->replacePermissions(Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 271
    .restart local v0    # "id":J
    const-wide/16 v4, 0x0

    cmp-long v3, v0, v4

    if-lez v3, :cond_13

    .line 272
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "permissions/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto/16 :goto_13

    .line 249
    nop

    :pswitch_data_a6
    .packed-switch 0x65
        :pswitch_14
        :pswitch_c
        :pswitch_54
        :pswitch_7c
    .end packed-switch
.end method

.method public onCreate()Z
    .registers 3

    .prologue
    .line 285
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onCreate"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 286
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    .line 287
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->setupUriMatcher(Landroid/content/Context;)V

    .line 288
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 33
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    .line 299
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v4

    packed-switch v4, :pswitch_data_34c

    .line 414
    :pswitch_b
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unrecognized query: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 417
    const/4 v4, 0x0

    :goto_26
    return-object v4

    .line 302
    :pswitch_27
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPacksContent([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_26

    .line 305
    :pswitch_36
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPacks([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_26

    .line 308
    :pswitch_43
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 309
    .local v5, "identifier":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackContentByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_26

    .line 312
    .end local v5    # "identifier":Ljava/lang/String;
    :pswitch_60
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v23

    .line 313
    .local v23, "id":I
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackContentById(I[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_26

    .line 316
    .end local v23    # "id":I
    :pswitch_83
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x3

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v23

    .line 317
    .restart local v23    # "id":I
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackItems(I[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto :goto_26

    .line 320
    .end local v23    # "id":I
    :pswitch_a6
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v23

    .line 321
    .restart local v23    # "id":I
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move/from16 v0, v23

    int-to-long v10, v0

    move-object/from16 v0, p2

    invoke-virtual {v4, v10, v11, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackItemById(J[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 324
    .end local v23    # "id":I
    :pswitch_bb
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x3

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 325
    .restart local v5    # "identifier":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v6

    .line 326
    .local v6, "itemIdentifier":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    invoke-virtual/range {v4 .. v9}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackItemByIdentifier(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 329
    .end local v5    # "identifier":Ljava/lang/String;
    .end local v6    # "itemIdentifier":Ljava/lang/String;
    :pswitch_e1
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getManifestVersion([Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 332
    :pswitch_eb
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    .line 333
    .restart local v5    # "identifier":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 336
    .end local v5    # "identifier":Ljava/lang/String;
    :pswitch_f9
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 337
    .local v14, "aLong":J
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v14, v15, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackById(J[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 340
    .end local v14    # "aLong":J
    :pswitch_10b
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v24

    .line 341
    .local v24, "packId":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    invoke-virtual {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackDownloadStatus(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 344
    .end local v24    # "packId":Ljava/lang/String;
    :pswitch_11b
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v20

    .line 345
    .local v20, "downloadId":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    invoke-virtual {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPackIdOfDownload(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 348
    .end local v20    # "downloadId":Ljava/lang/String;
    :pswitch_12b
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 349
    .local v8, "packType":Ljava/lang/String;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getAvailablePacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 352
    .end local v8    # "packType":Ljava/lang/String;
    :pswitch_14f
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 353
    .restart local v8    # "packType":Ljava/lang/String;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getHiddenPacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 356
    .end local v8    # "packType":Ljava/lang/String;
    :pswitch_173
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 357
    .restart local v8    # "packType":Ljava/lang/String;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getAvailablePacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 358
    .local v18, "cursor1":Landroid/database/Cursor;
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-virtual/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getHiddenPacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v19

    .line 359
    .local v19, "cursor2":Landroid/database/Cursor;
    new-instance v4, Landroid/database/MergeCursor;

    const/4 v7, 0x2

    new-array v7, v7, [Landroid/database/Cursor;

    const/4 v10, 0x0

    aput-object v18, v7, v10

    const/4 v10, 0x1

    aput-object v19, v7, v10

    invoke-direct {v4, v7}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    goto/16 :goto_26

    .line 362
    .end local v8    # "packType":Ljava/lang/String;
    .end local v18    # "cursor1":Landroid/database/Cursor;
    .end local v19    # "cursor2":Landroid/database/Cursor;
    :pswitch_1b3
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 363
    .restart local v8    # "packType":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v8, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getInstalledPacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 366
    .end local v8    # "packType":Ljava/lang/String;
    :pswitch_1d3
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getInstalledPacks([Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 369
    :pswitch_1df
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 370
    .restart local v8    # "packType":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v8, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getAvailableForRestorePacksByType(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 373
    .end local v8    # "packType":Ljava/lang/String;
    :pswitch_1ff
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    .line 374
    .restart local v5    # "identifier":Ljava/lang/String;
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getMessageByIdentifier(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 377
    .end local v5    # "identifier":Ljava/lang/String;
    :pswitch_20d
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getMessages([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 380
    :pswitch_21b
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v4, v7, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getActiveMessage(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 383
    :pswitch_229
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v4, v7, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getNextMessage(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 386
    :pswitch_237
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p2

    invoke-virtual {v4, v7, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getFutureMessages(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 389
    :pswitch_245
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    .line 390
    .local v16, "aLong1":J
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-wide/from16 v0, v16

    move-object/from16 v2, p2

    invoke-virtual {v4, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getMessageContent(J[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 394
    .end local v16    # "aLong1":J
    :pswitch_269
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v8

    .line 395
    .restart local v8    # "packType":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x6

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 396
    .local v9, "count":I
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x5

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    .line 397
    .local v22, "freeOnly":I
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x4

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v26

    .line 398
    .local v26, "showItems":I
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x3

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v7, 0x1

    if-ne v4, v7, :cond_2fb

    const/4 v12, 0x1

    .line 399
    .local v12, "showInstalledPacks":Z
    :goto_2d1
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v7, 0x1

    if-ne v4, v7, :cond_2fd

    const/4 v13, 0x1

    .line 400
    .local v13, "showOwnedDivider":Z
    :goto_2ed
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    if-eqz v22, :cond_2ff

    const/4 v10, 0x1

    :goto_2f2
    if-eqz v26, :cond_301

    const/4 v11, 0x1

    :goto_2f5
    invoke-virtual/range {v7 .. v13}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getTray(Ljava/lang/String;IZZZZ)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 398
    .end local v12    # "showInstalledPacks":Z
    .end local v13    # "showOwnedDivider":Z
    :cond_2fb
    const/4 v12, 0x0

    goto :goto_2d1

    .line 399
    .restart local v12    # "showInstalledPacks":Z
    :cond_2fd
    const/4 v13, 0x0

    goto :goto_2ed

    .line 400
    .restart local v13    # "showOwnedDivider":Z
    :cond_2ff
    const/4 v10, 0x0

    goto :goto_2f2

    :cond_301
    const/4 v11, 0x0

    goto :goto_2f5

    .line 403
    .end local v8    # "packType":Ljava/lang/String;
    .end local v9    # "count":I
    .end local v12    # "showInstalledPacks":Z
    .end local v13    # "showOwnedDivider":Z
    .end local v22    # "freeOnly":I
    .end local v26    # "showItems":I
    :pswitch_303
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    .line 404
    .local v25, "packsCount":I
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x2

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v21

    .line 405
    .local v21, "featured":I
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    if-lez v21, :cond_330

    const/4 v4, 0x1

    :goto_328
    move/from16 v0, v25

    invoke-virtual {v7, v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getFeatured(ZI)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    :cond_330
    const/4 v4, 0x0

    goto :goto_328

    .line 408
    .end local v21    # "featured":I
    .end local v25    # "packsCount":I
    :pswitch_332
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4, v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getFeaturedBanners(I)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 411
    :pswitch_342
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->getPermissions([Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    goto/16 :goto_26

    .line 299
    :pswitch_data_34c
    .packed-switch 0x1
        :pswitch_e1
        :pswitch_20d
        :pswitch_1ff
        :pswitch_245
        :pswitch_f9
        :pswitch_eb
        :pswitch_36
        :pswitch_60
        :pswitch_43
        :pswitch_83
        :pswitch_12b
        :pswitch_a6
        :pswitch_21b
        :pswitch_229
        :pswitch_1df
        :pswitch_b
        :pswitch_1b3
        :pswitch_1d3
        :pswitch_14f
        :pswitch_173
        :pswitch_bb
        :pswitch_237
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_27
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_10b
        :pswitch_11b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_b
        :pswitch_269
        :pswitch_342
        :pswitch_303
        :pswitch_332
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 18
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 427
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    packed-switch v1, :pswitch_data_184

    .line 474
    :pswitch_9
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "invalid uri"

    invoke-interface {v1, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 475
    const/4 v1, 0x0

    :goto_11
    return v1

    .line 430
    :pswitch_12
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x3

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 431
    .local v4, "id":J
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 432
    .local v6, "status":I
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v1, v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updateDownloadStatus(JI)I

    move-result v1

    goto :goto_11

    .line 435
    .end local v4    # "id":J
    .end local v6    # "status":I
    :pswitch_39
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 436
    .restart local v4    # "id":J
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v1, v4, v5, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePack(JLandroid/content/ContentValues;)I

    move-result v1

    goto :goto_11

    .line 439
    .end local v4    # "id":J
    :pswitch_58
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 440
    .restart local v4    # "id":J
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 441
    .local v2, "packId":J
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePackContent(JJLandroid/content/ContentValues;)I

    move-result v1

    goto :goto_11

    .line 444
    .end local v2    # "packId":J
    .end local v4    # "id":J
    :pswitch_90
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 445
    .restart local v4    # "id":J
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v1, v4, v5, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updateMessage(JLandroid/content/ContentValues;)I

    move-result v1

    goto/16 :goto_11

    .line 448
    .end local v4    # "id":J
    :pswitch_b0
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x5

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 449
    .restart local v4    # "id":J
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 450
    .local v10, "aLong":J
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    move-wide v8, v4

    move-object v12, p2

    invoke-virtual/range {v7 .. v12}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updateMessageContent(JJLandroid/content/ContentValues;)I

    move-result v1

    goto/16 :goto_11

    .line 453
    .end local v4    # "id":J
    .end local v10    # "aLong":J
    :pswitch_ea
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x3

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 454
    .restart local v4    # "id":J
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 455
    .local v0, "visited":I
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v1, v4, v5, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->setMessageasVisited(JI)I

    move-result v1

    goto/16 :goto_11

    .line 458
    .end local v0    # "visited":I
    .end local v4    # "id":J
    :pswitch_112
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x3

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 459
    .restart local v4    # "id":J
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x6

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 460
    .restart local v2    # "packId":J
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 461
    .restart local v6    # "status":I
    const/4 v7, 0x0

    .line 462
    .local v7, "contentPath":Ljava/lang/String;
    if-eqz p2, :cond_153

    .line 463
    const-string v1, "content_contentPath"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 465
    :cond_153
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePackContentPurchasedStatus(JJILjava/lang/String;)I

    move-result v1

    goto/16 :goto_11

    .line 469
    .end local v2    # "packId":J
    .end local v4    # "id":J
    .end local v6    # "status":I
    .end local v7    # "contentPath":Ljava/lang/String;
    :pswitch_15b
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x3

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 470
    .restart local v2    # "packId":J
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 471
    .restart local v6    # "status":I
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;->mDbHelper:Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;

    invoke-virtual {v1, v2, v3, v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsDatabaseHelper;->updatePackContentRequestDownloadStatus(JI)I

    move-result v1

    goto/16 :goto_11

    .line 427
    nop

    :pswitch_data_184
    .packed-switch 0xc9
        :pswitch_90
        :pswitch_b0
        :pswitch_58
        :pswitch_39
        :pswitch_9
        :pswitch_12
        :pswitch_112
        :pswitch_15b
        :pswitch_ea
    .end packed-switch
.end method
