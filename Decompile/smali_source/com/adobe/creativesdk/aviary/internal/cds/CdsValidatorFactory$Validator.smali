.class public abstract Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;
.super Ljava/lang/Object;
.source "CdsValidatorFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Validator"
.end annotation


# instance fields
.field logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field final mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 3
    .param p1, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "AdobeImageCdsValidatorFactory"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 20
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsValidatorFactory$Validator;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 21
    return-void
.end method


# virtual methods
.method public abstract validate(Landroid/content/Context;JLjava/io/File;Z)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation
.end method
