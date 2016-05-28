.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewDesignLibraryItemsListViewController.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;->setSections([Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;

    .prologue
    .line 378
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;)I
    .registers 5
    .param p1, "o"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;
    .param p2, "o1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    .prologue
    .line 381
    iget v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    iget v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    if-ne v0, v1, :cond_8

    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    iget v0, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    iget v1, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;->firstPosition:I

    if-ge v0, v1, :cond_10

    const/4 v0, -0x1

    goto :goto_7

    :cond_10
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 378
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$1;->compare(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewDesignLibraryItemsListViewController$SimpleSectionedRecyclerViewAdapter$Section;)I

    move-result v0

    return v0
.end method
