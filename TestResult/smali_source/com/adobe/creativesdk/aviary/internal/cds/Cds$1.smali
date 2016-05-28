.class synthetic Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;
.super Ljava/lang/Object;
.source "Cds.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/Cds;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

.field static final synthetic $SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 80
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    :try_start_9
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Large:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_52

    :goto_14
    :try_start_14
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Medium:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_50

    :goto_1f
    :try_start_1f
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$Size:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->Small:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Size;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_4e

    .line 69
    :goto_2a
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->values()[Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    :try_start_33
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->STICKER:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_4c

    :goto_3e
    :try_start_3e
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$cds$Cds$PackType:[I

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->OVERLAY:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_49} :catch_4a

    :goto_49
    return-void

    :catch_4a
    move-exception v0

    goto :goto_49

    :catch_4c
    move-exception v0

    goto :goto_3e

    .line 80
    :catch_4e
    move-exception v0

    goto :goto_2a

    :catch_50
    move-exception v0

    goto :goto_1f

    :catch_52
    move-exception v0

    goto :goto_14
.end method
