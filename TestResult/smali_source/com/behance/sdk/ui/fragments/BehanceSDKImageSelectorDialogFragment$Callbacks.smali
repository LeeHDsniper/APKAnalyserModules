.class public interface abstract Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
.super Ljava/lang/Object;
.source "BehanceSDKImageSelectorDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callbacks"
.end annotation


# virtual methods
.method public abstract onImageSelectorOnError(Ljava/lang/Exception;)V
.end method

.method public abstract onImageSelectorSelectionBackPressed()V
.end method

.method public abstract onImageSelectorSelectionCanceled()V
.end method

.method public abstract onImageSelectorSelectionFinished(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation
.end method
