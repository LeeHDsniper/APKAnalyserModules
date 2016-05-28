.class public final Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;
.super Ljava/lang/Object;
.source "PackageManagerUtils.java"


# static fields
.field private static final DEBUG_DN:Ljavax/security/auth/x500/X500Principal;

.field private static isDebugVersionChecked:Z

.field private static final isDebugVersionLock:Ljava/lang/Object;

.field private static isDebugVersionValue:Z

.field private static mInfo:Landroid/content/pm/ApplicationInfo;

.field private static mPackageInfo:Landroid/content/pm/PackageInfo;

.field private static sCdsAuthority:Ljava/lang/String;

.field private static sCdsProviderContentUri:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionLock:Ljava/lang/Object;

    .line 169
    new-instance v0, Ljavax/security/auth/x500/X500Principal;

    const-string v1, "CN=Android Debug,O=Android,C="

    invoke-direct {v0, v1}, Ljavax/security/auth/x500/X500Principal;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->DEBUG_DN:Ljavax/security/auth/x500/X500Principal;

    return-void
.end method

.method public static getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mInfo:Landroid/content/pm/ApplicationInfo;

    if-nez v1, :cond_14

    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 44
    .local v0, "manager":Landroid/content/pm/PackageManager;
    :try_start_8
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mInfo:Landroid/content/pm/ApplicationInfo;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_14} :catch_17

    .line 49
    .end local v0    # "manager":Landroid/content/pm/PackageManager;
    :cond_14
    :goto_14
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mInfo:Landroid/content/pm/ApplicationInfo;

    return-object v1

    .line 45
    .restart local v0    # "manager":Landroid/content/pm/PackageManager;
    :catch_17
    move-exception v1

    goto :goto_14
.end method

.method public static getCDSProviderAuthority(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 117
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsAuthority:Ljava/lang/String;

    if-nez v0, :cond_27

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsProvider;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsAuthority:Ljava/lang/String;

    .line 120
    :cond_27
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsAuthority:Ljava/lang/String;

    return-object v0
.end method

.method public static getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "requestCode"    # Ljava/lang/String;

    .prologue
    .line 137
    if-nez p1, :cond_b

    .line 138
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 140
    :goto_a
    return-object v0

    :cond_b
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_a
.end method

.method public static getCDSProviderContentUrl(Landroid/content/Context;)Ljava/lang/String;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 127
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsProviderContentUri:Ljava/lang/String;

    if-nez v0, :cond_1d

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "content://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderAuthority(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsProviderContentUri:Ljava/lang/String;

    .line 130
    :cond_1d
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->sCdsProviderContentUri:Ljava/lang/String;

    return-object v0
.end method

.method public static getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mPackageInfo:Landroid/content/pm/PackageInfo;

    if-nez v1, :cond_15

    .line 60
    if-eqz p0, :cond_15

    .line 61
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 63
    .local v0, "manager":Landroid/content/pm/PackageManager;
    :try_start_a
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    sput-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mPackageInfo:Landroid/content/pm/PackageInfo;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_15} :catch_18

    .line 69
    .end local v0    # "manager":Landroid/content/pm/PackageManager;
    :cond_15
    :goto_15
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->mPackageInfo:Landroid/content/pm/PackageInfo;

    return-object v1

    .line 64
    .restart local v0    # "manager":Landroid/content/pm/PackageManager;
    :catch_18
    move-exception v1

    goto :goto_15
.end method

.method public static isDebugVersion(Landroid/content/Context;)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    .line 100
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionLock:Ljava/lang/Object;

    monitor-enter v1

    .line 101
    :try_start_4
    sget-boolean v2, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionChecked:Z

    if-nez v2, :cond_13

    .line 102
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isSignedReleaseVersion(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_31

    :goto_e
    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionValue:Z

    .line 103
    const/4 v0, 0x1

    sput-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionChecked:Z

    .line 105
    :cond_13
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_4 .. :try_end_14} :catchall_33

    .line 106
    const-string v0, "TAG"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isDebugVersionValue: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionValue:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isDebugVersionValue:Z

    return v0

    .line 102
    :cond_31
    const/4 v0, 0x0

    goto :goto_e

    .line 105
    :catchall_33
    move-exception v0

    :try_start_34
    monitor-exit v1
    :try_end_35
    .catchall {:try_start_34 .. :try_end_35} :catchall_33

    throw v0
.end method

.method private static isSignedReleaseVersion(Landroid/content/Context;)Z
    .registers 13
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 172
    const/4 v2, 0x0

    .line 175
    .local v2, "debuggable":Z
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x40

    invoke-virtual {v8, v9, v10}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 176
    .local v3, "pinfo":Landroid/content/pm/PackageInfo;
    iget-object v5, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 177
    .local v5, "signatures":[Landroid/content/pm/Signature;
    const-string v8, "X.509"

    invoke-static {v8}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v1

    .line 179
    .local v1, "cf":Ljava/security/cert/CertificateFactory;
    array-length v9, v5

    move v8, v7

    :goto_1a
    if-ge v8, v9, :cond_4e

    aget-object v4, v5, v8

    .line 180
    .local v4, "signature":Landroid/content/pm/Signature;
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v4}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 181
    .local v6, "stream":Ljava/io/ByteArrayInputStream;
    invoke-virtual {v1, v6}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 182
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    const-string v10, "PackageManagerUtils"

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v11

    invoke-virtual {v11}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v10

    invoke-virtual {v10}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->DEBUG_DN:Ljavax/security/auth/x500/X500Principal;

    invoke-virtual {v11}, Ljavax/security/auth/x500/X500Principal;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_4b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_4b} :catch_57
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_4b} :catch_55

    move-result v2

    .line 184
    if-eqz v2, :cond_52

    .line 193
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v3    # "pinfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "signature":Landroid/content/pm/Signature;
    .end local v5    # "signatures":[Landroid/content/pm/Signature;
    .end local v6    # "stream":Ljava/io/ByteArrayInputStream;
    :cond_4e
    :goto_4e
    if-nez v2, :cond_51

    const/4 v7, 0x1

    :cond_51
    return v7

    .line 179
    .restart local v0    # "cert":Ljava/security/cert/X509Certificate;
    .restart local v1    # "cf":Ljava/security/cert/CertificateFactory;
    .restart local v3    # "pinfo":Landroid/content/pm/PackageInfo;
    .restart local v4    # "signature":Landroid/content/pm/Signature;
    .restart local v5    # "signatures":[Landroid/content/pm/Signature;
    .restart local v6    # "stream":Ljava/io/ByteArrayInputStream;
    :cond_52
    add-int/lit8 v8, v8, 0x1

    goto :goto_1a

    .line 190
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    .end local v1    # "cf":Ljava/security/cert/CertificateFactory;
    .end local v3    # "pinfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "signature":Landroid/content/pm/Signature;
    .end local v5    # "signatures":[Landroid/content/pm/Signature;
    .end local v6    # "stream":Ljava/io/ByteArrayInputStream;
    :catch_55
    move-exception v8

    goto :goto_4e

    .line 188
    :catch_57
    move-exception v8

    goto :goto_4e
.end method

.method public static isStandalone(Landroid/content/Context;)Z
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 93
    const-string v0, "com.aviary.android.feather"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
