.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryCollectionListViewController.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    .prologue
    .line 300
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryCollectionListViewController$DesignLibraryCollectionListViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 6
    .param p1, "obj1"    # Ljava/lang/Object;
    .param p2, "obj2"    # Ljava/lang/Object;

    .prologue
    .line 304
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .end local p1    # "obj1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v0

    .line 305
    .local v0, "id1":Ljava/lang/String;
    check-cast p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;

    .end local p2    # "obj2":Ljava/lang/Object;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v1

    .line 306
    .local v1, "id2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v2

    return v2
.end method
