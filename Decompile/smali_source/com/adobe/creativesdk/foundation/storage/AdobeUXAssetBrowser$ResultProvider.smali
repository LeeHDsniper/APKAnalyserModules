.class public Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;
.super Ljava/lang/Object;
.source "AdobeUXAssetBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResultProvider"
.end annotation


# instance fields
.field private final _intent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 266
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;->_intent:Landroid/content/Intent;

    .line 267
    return-void
.end method


# virtual methods
.method public getSelectionAssetArray()Ljava/util/ArrayList;
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 275
    const/4 v9, 0x0

    .line 276
    .local v9, "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;->_intent:Landroid/content/Intent;

    move-object/from16 v17, v0

    if-eqz v17, :cond_4f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowser$ResultProvider;->_intent:Landroid/content/Intent;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 277
    .local v8, "resultData":Landroid/os/Bundle;
    :goto_13
    if-eqz v8, :cond_4e

    .line 281
    :try_start_15
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_ASSETS_SELECTION_LIST:Ljava/lang/String;

    .line 282
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v12

    check-cast v12, Ljava/util/ArrayList;

    .line 283
    .local v12, "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    if-eqz v12, :cond_51

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_51

    .line 285
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V
    :try_end_2c
    .catch Ljava/lang/ClassCastException; {:try_start_15 .. :try_end_2c} :catch_84

    .line 286
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .local v10, "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :try_start_2c
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_30
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_52

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;

    .line 288
    .local v4, "info":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->AdobeAssetFileFromInfo(Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v2

    .line 289
    .local v2, "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    new-instance v11, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;

    invoke-direct {v11, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 290
    .local v11, "selectionAssetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;
    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_48
    .catch Ljava/lang/ClassCastException; {:try_start_2c .. :try_end_48} :catch_49

    goto :goto_30

    .line 338
    .end local v2    # "assetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .end local v4    # "info":Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;
    .end local v11    # "selectionAssetFile":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;
    :catch_49
    move-exception v3

    move-object v9, v10

    .line 340
    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .end local v12    # "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    .local v3, "e":Ljava/lang/ClassCastException;
    :goto_4b
    invoke-virtual {v3}, Ljava/lang/ClassCastException;->printStackTrace()V

    .line 344
    .end local v3    # "e":Ljava/lang/ClassCastException;
    :cond_4e
    :goto_4e
    return-object v9

    .line 276
    .end local v8    # "resultData":Landroid/os/Bundle;
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_4f
    const/4 v8, 0x0

    goto :goto_13

    .restart local v8    # "resultData":Landroid/os/Bundle;
    .restart local v12    # "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    :cond_51
    move-object v10, v9

    .line 295
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_52
    :try_start_52
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_PHOTOS_SELECTION_LIST:Ljava/lang/String;

    .line 296
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    .line 297
    .local v16, "selectionPhotoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    if-eqz v16, :cond_87

    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_87

    .line 299
    if-nez v10, :cond_db

    .line 300
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_6b
    .catch Ljava/lang/ClassCastException; {:try_start_52 .. :try_end_6b} :catch_49

    .line 302
    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :goto_6b
    :try_start_6b
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_6f
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_86

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 304
    .local v7, "photo":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    new-instance v15, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;

    invoke-direct {v15, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V

    .line 305
    .local v15, "selectionPhoto":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_83
    .catch Ljava/lang/ClassCastException; {:try_start_6b .. :try_end_83} :catch_84

    goto :goto_6f

    .line 338
    .end local v7    # "photo":Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .end local v12    # "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    .end local v15    # "selectionPhoto":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;
    .end local v16    # "selectionPhotoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    :catch_84
    move-exception v3

    goto :goto_4b

    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v12    # "selectionInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageAssetFileInfo;>;"
    .restart local v16    # "selectionPhotoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;>;"
    :cond_86
    move-object v10, v9

    .line 310
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_87
    :try_start_87
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_LIBRARY_SELECTION_LIST:Ljava/lang/String;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 311
    .local v5, "libraryItemID":Ljava/lang/String;
    if-eqz v5, :cond_ad

    .line 312
    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->isLibraryItemSame(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_ad

    .line 313
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->creationSelectionLibraryFromCurrentSelection()Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;

    move-result-object v13

    .line 315
    .local v13, "selectionLibraryAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    if-nez v10, :cond_d9

    .line 316
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_a6
    .catch Ljava/lang/ClassCastException; {:try_start_87 .. :try_end_a6} :catch_49

    .line 318
    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :goto_a6
    :try_start_a6
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v10, v9

    .line 319
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageLibrarySelectionState;->resetSelection()V
    :try_end_ad
    .catch Ljava/lang/ClassCastException; {:try_start_a6 .. :try_end_ad} :catch_84

    .line 324
    .end local v13    # "selectionLibraryAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    :cond_ad
    :try_start_ad
    sget-object v17, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewBrowserSelectFilesHelper;->ASSETBROWSER_MOBILE_PACKAGE_SELECTION_ITEM:Ljava/lang/String;

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 325
    .local v6, "packageItemId":Ljava/lang/String;
    if-eqz v6, :cond_d6

    .line 326
    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->isPackageItemSame(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_d6

    .line 327
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->creationSelectionPackageFromCurrentSelection()Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;

    move-result-object v14

    .line 329
    .local v14, "selectionPackage":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    if-nez v10, :cond_d4

    .line 330
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V
    :try_end_cc
    .catch Ljava/lang/ClassCastException; {:try_start_ad .. :try_end_cc} :catch_49

    .line 332
    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :goto_cc
    :try_start_cc
    invoke-virtual {v9, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetMobileCreationSelectionState;->resetSelection()V
    :try_end_d2
    .catch Ljava/lang/ClassCastException; {:try_start_cc .. :try_end_d2} :catch_84

    goto/16 :goto_4e

    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_d4
    move-object v9, v10

    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    goto :goto_cc

    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .end local v14    # "selectionPackage":Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_d6
    move-object v9, v10

    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    goto/16 :goto_4e

    .end local v6    # "packageItemId":Ljava/lang/String;
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v13    # "selectionLibraryAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    :cond_d9
    move-object v9, v10

    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    goto :goto_a6

    .end local v5    # "libraryItemID":Ljava/lang/String;
    .end local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .end local v13    # "selectionLibraryAsset":Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
    .restart local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    :cond_db
    move-object v9, v10

    .end local v10    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    .restart local v9    # "selectedAssets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;>;"
    goto :goto_6b
.end method
