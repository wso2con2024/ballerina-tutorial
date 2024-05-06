/**
 * Copyright (c) 2024, WSO2 LLC. (https://www.wso2.com).
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import {
    Box,
    Card,
    CardContent,
    CardActions,
    Typography,
    Button
} from '@mui/material';
import Info from '@mui/icons-material/Info';
import { useNavigate } from 'react-router-dom';
import BallerinaCircularProgress from './BallerinaCircularProgress';


export default function QueryResult({ loading, error, data, children }) {
    if (error) {
        return (
            <Box sx={{
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                height: '70vh',
            }}>
                <ErrorCard message={error.message} />
            </Box>
        )
    }

    if (loading) {
        return (
            <Box sx={{
                display: 'flex',
                justifyContent: 'center',
                alignItems: 'center',
                width: '100%',
                height: '100vh',
            }}>
                <BallerinaCircularProgress size={9} thickness={5} />
            </Box>
        );
    }
    if (!data) {
        return <p>Nothing to show...</p>
    }
    if (data) {
        return children;
    }
}

const ErrorCard = ({ message }) => {
    const navigate = useNavigate()

    return (
        <Card sx={{
            maxWidth: "20rem",
            display: "flex",
            flexDirection: "column",
            justifyContent: "space-between",
            alignItems: "center",
            textAlign: "center",
        }}>
            <CardContent>
                <Info color="primary" fontSize="large" />
                <Typography component="h5" variant="h5" marginTop="2rem">
                    {message}
                </Typography>
            </CardContent>
            <CardActions sx={{ marginBottom: "2rem" }}>
                <Button
                    size="large"
                    variant="contained"
                    color="primary"
                    sx={{ color: "#ffffff" }}
                    onClick={() => navigate("/")}
                >
                    Go Back
                </Button>
            </CardActions>
        </Card>
    )
}
