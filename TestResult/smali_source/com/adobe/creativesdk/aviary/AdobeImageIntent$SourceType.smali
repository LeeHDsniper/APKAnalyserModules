.class public final enum Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;
.super Ljava/lang/Enum;
.source "AdobeImageIntent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageIntent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

.field public static final enum Camera:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

.field public static final enum Gallery:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

.field public static final enum Grid:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

.field public static final enum None:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 156
    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    const-string v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->None:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    const-string v1, "Camera"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Camera:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    const-string v1, "Gallery"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Gallery:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    const-string v1, "Grid"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Grid:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    .line 155
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->None:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Camera:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Gallery:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->Grid:Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->$VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 155
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 155
    const-class v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;
    .registers 1

    .prologue
    .line 155
    sget-object v0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->$VALUES:[Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;

    return-object v0
.end method
