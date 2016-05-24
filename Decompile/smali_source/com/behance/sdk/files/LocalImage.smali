.class public Lcom/behance/sdk/files/LocalImage;
.super Lcom/behance/sdk/project/modules/ImageModule;
.source "LocalImage.java"


# static fields
.field private static final serialVersionUID:J = 0x5a9bf9eae4857eaeL


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .registers 5
    .param p1, "parseLong"    # J
    .param p3, "file"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/behance/sdk/project/modules/ImageModule;-><init>(JLjava/lang/String;)V

    .line 38
    return-void
.end method
