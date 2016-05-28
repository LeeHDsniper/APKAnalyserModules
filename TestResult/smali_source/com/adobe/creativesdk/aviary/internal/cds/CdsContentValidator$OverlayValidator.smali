.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$OverlayValidator;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;
.source "CdsContentValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OverlayValidator"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsContentValidator$ContentValidator;-><init>()V

    return-void
.end method


# virtual methods
.method validateItem(Ljava/lang/String;Ljava/util/List;)Z
    .registers 4
    .param p1, "identifier"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 186
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    return v0
.end method

.method validateItem(Ljava/lang/String;Ljava/util/zip/ZipFile;)Z
    .registers 4
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "zipFile"    # Ljava/util/zip/ZipFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .prologue
    .line 181
    const/4 v0, 0x1

    return v0
.end method
