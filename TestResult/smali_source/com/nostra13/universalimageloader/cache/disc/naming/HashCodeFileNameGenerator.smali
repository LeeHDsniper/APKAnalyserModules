.class public Lcom/nostra13/universalimageloader/cache/disc/naming/HashCodeFileNameGenerator;
.super Ljava/lang/Object;
.source "HashCodeFileNameGenerator.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public generate(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
