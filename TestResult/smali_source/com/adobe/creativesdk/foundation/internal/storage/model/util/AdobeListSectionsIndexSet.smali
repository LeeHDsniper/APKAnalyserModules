.class public Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;
.super Ljava/lang/Object;
.source "AdobeListSectionsIndexSet.java"


# instance fields
.field private _sectionIndexSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;->_sectionIndexSet:Ljava/util/HashSet;

    .line 28
    return-void
.end method


# virtual methods
.method public add(I)V
    .registers 4
    .param p1, "section"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeListSectionsIndexSet;->_sectionIndexSet:Ljava/util/HashSet;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    return-void
.end method
