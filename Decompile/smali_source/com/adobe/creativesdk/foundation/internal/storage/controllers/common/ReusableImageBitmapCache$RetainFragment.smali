.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;
.super Landroid/support/v4/app/Fragment;
.source "ReusableImageBitmapCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RetainFragment"
.end annotation


# instance fields
.field private mObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 488
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getObject()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 513
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;->mObject:Ljava/lang/Object;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 492
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 495
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;->setRetainInstance(Z)V

    .line 496
    return-void
.end method

.method public setObject(Ljava/lang/Object;)V
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$RetainFragment;->mObject:Ljava/lang/Object;

    .line 505
    return-void
.end method
